/mob/living/
	var/obj/screen/fov_mask
	var/obj/screen/fov_shadow
	var/usefov = TRUE
	var/hasmask = FALSE
	var/fovangle = 90

/mob/living/SelfMove(direction)
	. = ..()
	if(client)
		check_fov()

/mob/living/set_dir()
	. = ..()
	if(client)
		check_fov()

/mob/living/UpdateLyingBuckledAndVerbStatus()
	. = ..()
	if(client)
		check_fov()

/mob/living/proc/update_fov_dir()
	if(usefov && hasmask)
		fov_mask.dir = src.dir
		fov_shadow.dir = src.dir

/mob/living/proc/check_fov()
	if(client)
		if(resting || lying || client.eye != client.mob)
			hide_cone()
		else if(usefov)
			show_cone()
			update_fov_dir()
		else
			hide_cone()

/mob/living/proc/toggle_fov()
	if(client)
		usefov = !usefov
		src.check_fov()

// //Making these generic procs so you can call them anywhere.
/mob/living/proc/show_cone()
	if(client && !hasmask)
		if(!fov_shadow)
			fov_shadow = new /obj/screen/fov_shadow(src)
		client.screen += fov_shadow
		if(!fov_mask)
			fov_mask = new /obj/screen/fov_blocker(src)
		client.screen += fov_mask
		hasmask = TRUE

/mob/living/proc/hide_cone()
	if(client && hasmask)
		client.screen -= fov_shadow
		client.screen -= fov_mask
		hasmask = FALSE

/mob/living/proc/in_fov(atom/observed_atom, ignore_self = FALSE)
	if(!client)
		return TRUE
	if(!observed_atom)
		return TRUE
	if(ignore_self && observed_atom == src)
		return TRUE
	if(is_blind())
		return FALSE
	. = FALSE
	var/turf/my_turf = get_turf(src) //Because being inside contents of something will cause our x,y to not be updated
	// If turf doesn't exist, then we wouldn't get a fov check called by `play_fov_effect` or presumably other new stuff that might check this.
	//  ^ If that case has changed and you need that check, add it.
	var/rel_x = observed_atom.x - my_turf.x
	var/rel_y = observed_atom.y - my_turf.y
	if(fovangle)
		if(rel_x >= -1 && rel_x <= 1 && rel_y >= -1 && rel_y <= 1) //Cheap way to check inside that 3x3 box around you
			return TRUE //Also checks if both are 0 to stop division by zero

		// Get the vector length so we can create a good directional vector
		var/vector_len = sqrt(abs(rel_x) ** 2 + abs(rel_y) ** 2)

		/// Getting a direction vector
		var/dir_x
		var/dir_y
		switch(dir)
			if(SOUTH)
				dir_x = 0
				dir_y = -vector_len
			if(NORTH)
				dir_x = 0
				dir_y = vector_len
			if(EAST)
				dir_x = vector_len
				dir_y = 0
			if(WEST)
				dir_x = -vector_len
				dir_y = 0

		///Calculate angle
		var/angle = arccos((dir_x * rel_x + dir_y * rel_y) / (sqrt(dir_x**2 + dir_y**2) * sqrt(rel_x**2 + rel_y**2)))

		/// Calculate vision angle and compare
		var/vision_angle = (360 - fovangle) / 2
		if(angle < vision_angle)
			. = TRUE
	else
		. = TRUE

/proc/remove_image_from_client(image/image_to_remove, client/remove_from)
	remove_from?.images -= image_to_remove

/// Plays a visual effect representing a sound cue for people with vision obstructed by FOV or blindness
/proc/play_fov_effect(atom/center, range, icon_state, dir = SOUTH, ignore_self = FALSE, angle = 0)
	var/turf/anchor_point = get_turf(center)
	var/image/fov_image
	for(var/mob/living/living_mob in view(range, center))
		var/client/mob_client = living_mob.client
		if(!mob_client)
			continue
		if(living_mob.in_fov(center, ignore_self))
			continue
		if(!fov_image) //Make the image once we found one recipient to receive it
			fov_image = image(icon = 'icons/effects/fov/fov_effects.dmi', icon_state = icon_state, loc = anchor_point)
			fov_image.plane = FULLSCREEN_PLANE
			fov_image.layer = 10000
			fov_image.dir = dir
			fov_image.appearance_flags = RESET_COLOR | RESET_TRANSFORM
			if(angle)
				var/matrix/matrix = new
				matrix.Turn(angle)
				fov_image.transform = matrix
			fov_image.mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
		mob_client.images += fov_image
		addtimer(CALLBACK(GLOBAL_PROC, .proc/remove_image_from_client, fov_image, mob_client), 30)

/obj/screen/fov_blocker
	icon = 'icons/effects/fov/field_of_view.dmi'
	icon_state = "90"
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	screen_loc = "BOTTOM,LEFT"

/obj/screen/fov_shadow
	icon = 'icons/effects/fov/field_of_view.dmi'
	icon_state = "90_v"
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	screen_loc = "BOTTOM,LEFT"

/mob/living/ghostize(can_reenter_corpse)
	if(hasmask)
		hide_cone()
	if(fov_mask)
		QDEL_NULL(fov_mask)
	if(fov_shadow)
		QDEL_NULL(fov_shadow)
	. = ..()


/mob/living/Logout()
	if(client)
		if(hasmask)
			hide_cone()
		if(fov_mask)
			QDEL_NULL(fov_mask)
		if(fov_shadow)
			QDEL_NULL(fov_shadow)
	. = ..()
