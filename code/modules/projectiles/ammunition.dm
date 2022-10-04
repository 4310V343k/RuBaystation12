/obj/item/ammo_casing
	name = "bullet casing"
	desc = "A bullet casing."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "pistolcasing"
	randpixel = 10
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT | SLOT_EARS
	throwforce = 1
	w_class = ITEM_SIZE_TINY

	var/leaves_residue = 1
	var/is_caseless = FALSE
	var/caliber = ""					//Which kind of guns it can be loaded into
	var/projectile_type					//The bullet type to create when New() is called
	var/obj/item/projectile/BB			//The loaded bullet - make it so that the projectiles are created only when needed?
	var/amount = 1
	var/maxamount = 15
	var/reload_delay = 0

	var/sprite_update_spawn = FALSE		//defaults to normal sized sprites
	var/sprite_max_rotate = 16
	var/sprite_scale = 1
	var/sprite_use_small = TRUE 		//A var for a later global option to use all big sprites or small sprites for bullets, must be used before startup
	var/spent_icon = "pistolcasing-spent"
	var/fall_sounds = list('sound/weapons/guns/casingfall1.ogg','sound/weapons/guns/casingfall2.ogg','sound/weapons/guns/casingfall3.ogg')

/obj/item/ammo_casing/Initialize()
	. = ..()
	if(sprite_update_spawn)
		var/matrix/rotation_matrix = matrix()
		rotation_matrix.Turn(round(45 * rand(0, sprite_max_rotate) / 2))
		if(sprite_use_small)
			src.transform = rotation_matrix * sprite_scale
		else
			src.transform = rotation_matrix
	if(ispath(projectile_type))
		BB = new projectile_type(src)
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)
	if(amount > 1)
		update_icon()

//removes the projectile from the ammo casing
/obj/item/ammo_casing/proc/expend()
	. = BB
	BB = null
	update_icon()

	// Aurora forensics port, gunpowder residue.
	if(leaves_residue)
		leave_residue()
		
/obj/item/ammo_casing/attack_hand(mob/user)
	if((src.amount > 1) && (src == user.get_inactive_hand()))
		src.amount -= 1
		var/obj/item/ammo_casing/new_casing = new /obj/item/ammo_casing(get_turf(user))
		new_casing.name = src.name
		new_casing.desc = src.desc
		new_casing.caliber = src.caliber
		new_casing.projectile_type = src.projectile_type
		new_casing.icon_state = src.icon_state
		new_casing.spent_icon = src.spent_icon
		new_casing.maxamount = src.maxamount
		if(ispath(new_casing.projectile_type) && src.BB)
			new_casing.BB = new new_casing.projectile_type(new_casing)
		else
			new_casing.BB = null

		new_casing.sprite_max_rotate = src.sprite_max_rotate
		new_casing.sprite_scale = src.sprite_scale
		new_casing.sprite_use_small = src.sprite_use_small
		new_casing.sprite_update_spawn = src.sprite_update_spawn

		if(new_casing.sprite_update_spawn)
			var/matrix/rotation_matrix = matrix()
			rotation_matrix.Turn(round(45 * rand(0, new_casing.sprite_max_rotate) / 2))
			if(new_casing.sprite_use_small)
				new_casing.transform = rotation_matrix * new_casing.sprite_scale
			else
				new_casing.transform = rotation_matrix

		new_casing.is_caseless = src.is_caseless
		new_casing.update_icon()
		src.update_icon()
		user.put_in_active_hand(new_casing)
	else
		return ..()

/obj/item/ammo_casing/proc/leave_residue()
	var/mob/living/carbon/human/H = get_holder_of_type(src, /mob/living/carbon/human)
	var/obj/item/gun/G = get_holder_of_type(src, /obj/item/gun)
	put_residue_on(G)
	if(H)
		var/zone
		if(H.l_hand == G)
			zone = BP_L_HAND
		else if(H.r_hand == G)
			zone = BP_R_HAND
		if(zone)
			var/target = H.get_covering_equipped_item_by_zone(zone)
			if(!target)
				target = H.get_organ(zone)
			put_residue_on(target)
	if(prob(30))
		put_residue_on(get_turf(src))

/obj/item/ammo_casing/proc/put_residue_on(atom/A)
	if(A)
		LAZYDISTINCTADD(A.gunshot_residue, caliber)

/obj/item/ammo_casing/attackby(obj/item/W as obj, mob/user as mob)
	if(isScrewdriver(W))
		if(!BB)
			to_chat(user, SPAN_NOTICE("There is no bullet in the casing to inscribe anything into."))
			return

		var/tmp_label = ""
		var/label_text = sanitizeSafe(input(user, "Inscribe some text into \the [initial(BB.name)]","Inscription",tmp_label), MAX_NAME_LEN)
		if(length(label_text) > 20)
			to_chat(user, SPAN_WARNING("The inscription can be at most 20 characters long."))
		else if(!label_text)
			to_chat(user, SPAN_NOTICE("You scratch the inscription off of [initial(BB)]."))
			BB.name = initial(BB.name)
		else
			to_chat(user, SPAN_NOTICE("You inscribe \"[label_text]\" into \the [initial(BB.name)]."))
			BB.name = "[initial(BB.name)] (\"[label_text]\")"
		return TRUE
	else if(istype(/obj/item/ammo_casing))
		if(isturf(src.loc))
			if(merging_casing.amount == merging_casing.maxamount)
				to_chat(user, SPAN_WARNING("[merging_casing] is fully stacked!"))
				return FALSE
			if(merging_casing.mergeCasing(src, null, user))
				return TRUE
		else if (mergeCasing(1, user))
			return TRUE

/obj/item/ammo_casing/proc/mergeCasing(var/obj/item/ammo_casing/AC, var/amountToMerge, var/mob/living/user, var/noMessage = FALSE, var/noIconUpdate = FALSE)
	if(!AC)
		return FALSE
	if(!user && noMessage == FALSE)
		error("Passed no user to mergeCasing() when output messages is active.")
	if(src.caliber != AC.caliber)
		if(!noMessage)
			to_chat(user, SPAN_WARNING("Ammo are different calibers."))
		return FALSE
	if(src.projectile_type != AC.projectile_type)
		if(!noMessage)
			to_chat(user, SPAN_WARNING("Ammo are different types."))
		return FALSE
	if(src.amount == src.maxamount)
		if(!noMessage)
			to_chat(user, SPAN_WARNING("[src] is fully stacked!"))
		return FALSE
	if((!src.BB && AC.BB) || (src.BB && !AC.BB))
		if(!noMessage)
			to_chat(user, SPAN_WARNING("Fired and non-fired ammo wont stack."))
		return FALSE

	var/mergedAmount
	if(!amountToMerge)
		mergedAmount = AC.amount
	else
		mergedAmount = amountToMerge
	if(mergedAmount + src.amount > src.maxamount)
		mergedAmount = src.maxamount - src.amount
	AC.amount -= mergedAmount
	src.amount += mergedAmount
	if(!noIconUpdate)
		src.update_icon()
	if(AC.amount == 0)
		QDEL_NULL(AC)
	else
		if(!noIconUpdate)
			AC.update_icon()
	return TRUE

/obj/item/ammo_casing/update_icon()
	if(spent_icon && !BB)
		icon_state = spent_icon
	src.overlays.Cut()
	if(amount > 1)
		src.pixel_x = 0
		src.pixel_y = 0

	for(var/icon_amount = 1; icon_amount < src.amount, icon_amount++)
		var/image/temp_image = image(src.icon, src.icon_state)
		var/coef = round(14 * icon_amount/src.maxamount)

		temp_image.pixel_x = rand(coef, -coef)
		temp_image.pixel_y = rand(coef, -coef)
		var/matrix/temp_image_matrix = matrix()
		temp_image_matrix.Turn(round(45 * rand(0, sprite_max_rotate) / 2))
		temp_image.transform = temp_image_matrix
		src.overlays += temp_image

/obj/item/ammo_casing/examine(mob/user)
	..()
	to_chat(user, "There [(amount == 1)? "is" : "are"] [amount] round\s left!")
	if (!BB)
		to_chat(user, "[(amount == 1)? "This one is" : "These ones are"] spent.")

/obj/item/ammo_casing/examine(mob/user)
	. = ..()
	if(caliber)
		to_chat(user, "Its caliber is [caliber].")
	if (!BB)
		to_chat(user, "This one is spent.")

//An item that holds casings and can be used to put them inside guns
/obj/item/ammo_magazine
	name = "magazine"
	desc = "A magazine for some kind of gun."
	icon_state = "357"
	icon = 'icons/obj/ammo.dmi'
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	item_state = "syringe_kit"
	matter = list(MATERIAL_STEEL = 500)
	throwforce = 5
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 10

	var/list/stored_ammo = list()
	var/mag_type = SPEEDLOADER //ammo_magazines can only be used with compatible guns. This is not a bitflag, the load_method var on guns is.
	var/caliber = "357"
	var/max_ammo = 7

	var/ammo_type = /obj/item/ammo_casing //ammo type that is initially loaded
	var/initial_ammo = null

	var/multiple_sprites = 0
	var/list/labels						//If something should be added to name on spawn aside from caliber
	//because BYOND doesn't support numbers as keys in associative lists
	var/list/icon_keys = list()		//keys
	var/list/ammo_states = list()	//values

/obj/item/ammo_magazine/box
	w_class = ITEM_SIZE_NORMAL

/obj/item/ammo_magazine/Initialize()
	. = ..()
	if(multiple_sprites)
		initialize_magazine_icondata(src)

	if(isnull(initial_ammo))
		initial_ammo = max_ammo

	if(initial_ammo)
		for(var/i in 1 to initial_ammo)
			stored_ammo += new ammo_type(src)
	if(caliber)
		LAZYINSERT(labels, caliber, 1)
	if(LAZYLEN(labels))
		SetName("[name] ([english_list(labels, and_text = ", ")])")
	update_icon()

/obj/item/ammo_magazine/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = W
		if(C.caliber != caliber)
			to_chat(user, "<span class='warning'>[C] does not fit into [src].</span>")
			return
		if(stored_ammo.len >= max_ammo)
			to_chat(user, "<span class='warning'>[src] is full!</span>")
			return
		if(!user.unEquip(C, src))
			return
		stored_ammo.Add(C)
		update_icon()
	else ..()

/obj/item/ammo_magazine/attack_self(mob/user)
	if(!stored_ammo.len)
		to_chat(user, "<span class='notice'>[src] is already empty!</span>")
		return
	to_chat(user, "<span class='notice'>You empty [src].</span>")
	for(var/obj/item/ammo_casing/C in stored_ammo)
		C.forceMove(user.loc)
		C.set_dir(pick(GLOB.alldirs))
	stored_ammo.Cut()
	update_icon()


/obj/item/ammo_magazine/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		if(!stored_ammo.len)
			to_chat(user, "<span class='notice'>[src] is already empty!</span>")
		else
			var/obj/item/ammo_casing/C = stored_ammo[stored_ammo.len]
			stored_ammo-=C
			user.put_in_hands(C)
			user.visible_message("\The [user] removes \a [C] from [src].", "<span class='notice'>You remove \a [C] from [src].</span>")
			update_icon()
	else
		..()
		return

/obj/item/ammo_magazine/on_update_icon()
	if(multiple_sprites)
		//find the lowest key greater than or equal to stored_ammo.len
		var/new_state = null
		for(var/idx in 1 to icon_keys.len)
			var/ammo_count = icon_keys[idx]
			if (ammo_count >= stored_ammo.len)
				new_state = ammo_states[idx]
				break
		icon_state = (new_state)? new_state : initial(icon_state)

/obj/item/ammo_magazine/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

//magazine icon state caching
var/global/list/magazine_icondata_keys = list()
var/global/list/magazine_icondata_states = list()

/proc/initialize_magazine_icondata(var/obj/item/ammo_magazine/M)
	var/typestr = "[M.type]"
	if(!(typestr in magazine_icondata_keys) || !(typestr in magazine_icondata_states))
		magazine_icondata_cache_add(M)

	M.icon_keys = magazine_icondata_keys[typestr]
	M.ammo_states = magazine_icondata_states[typestr]

/proc/magazine_icondata_cache_add(var/obj/item/ammo_magazine/M)
	var/list/icon_keys = list()
	var/list/ammo_states = list()
	var/list/states = icon_states(M.icon)
	for(var/i = 0, i <= M.max_ammo, i++)
		var/ammo_state = "[M.icon_state]-[i]"
		if(ammo_state in states)
			icon_keys += i
			ammo_states += ammo_state

	magazine_icondata_keys["[M.type]"] = icon_keys
	magazine_icondata_states["[M.type]"] = ammo_states

