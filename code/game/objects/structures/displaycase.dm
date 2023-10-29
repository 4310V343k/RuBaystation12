/obj/structure/displaycase
	name = "display case"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "glassbox"
	desc = "A display case for prized possessions. It taunts you to kick it."
	density = TRUE
	anchored = TRUE
	var/locked = 1
	unacidable = TRUE
	alpha = 150
	req_access = list()
	health_max = 14

/obj/structure/displaycase/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	for(var/atom/movable/AM in T)
		if(AM.simulated && !AM.anchored)
			AM.forceMove(src)
	update_icon()

/obj/structure/displaycase/examine(mob/user)
	. = ..()
	if(contents.len)
		to_chat(user, "Inside you see [english_list(contents)].")
		to_chat(user, "It looks [locked ? "locked. You can open it with your ID card" : "unlocked"].")

/obj/structure/displaycase/ex_act(severity)
	if (severity < EX_ACT_LIGHT)
		var/shuffled_contents = shuffle(contents)
		for (var/atom/A as anything in shuffled_contents)
			A.ex_act(severity + 1)
	..()

/obj/structure/displaycase/bullet_act(obj/item/projectile/Proj)
	if (Proj.penetrating)
		var/distance = get_dist(Proj.starting, get_turf(loc))
		var/list/items = contents.Copy()
		while (items.len)
			var/atom/A = pick_n_take(items)
			if (isliving(A))
				Proj.attack_mob(A, distance)
			else
				A.bullet_act(Proj)
			Proj.penetrating -= 1
			if(!Proj.penetrating)
				break
	. = ..()

/obj/structure/displaycase/on_death()
	set_density(FALSE)
	new /obj/item/material/shard(loc)
	for(var/atom/movable/AM in src)
		AM.dropInto(loc)
	playsound(src, "shatter", 70, 1)
	update_icon()

/obj/structure/displaycase/on_revive()
	update_icon()

/obj/structure/displaycase/on_update_icon()
	if(health_dead)
		icon_state = "glassboxb"
	else
		icon_state = "glassbox"
	underlays.Cut()
	for(var/atom/movable/AM in contents)
		underlays += AM.appearance

/obj/structure/displaycase/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/card/id))
		if(allowed(usr))
			locked = !locked
			to_chat(user, "[src]'s lock was [locked ? "enabled" : "disabled"].")
		else
			to_chat(user, "[src]'s card reader denied you.")
		return
	if(isitem(W))
		if(!locked)
			user.drop_item()
			W.pixel_x = 0
			W.pixel_y = -7
			W.forceMove(get_turf(src))
			Initialize()
			return
	if(user.a_intent == I_HURT)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		damage_health(W.force)
	..()

/obj/structure/displaycase/attack_hand(mob/user as mob, obj/item/W as obj)
	add_fingerprint(user)
	if(!locked)
		for(var/atom/movable/AM in src)
			to_chat(user, "You picking up [AM] from the [src].")
			AM.dropInto(loc)
			update_icon()
		return
	if(!health_dead)
		to_chat(usr, text("<span class='warning'>You kick the display case.</span>"))
		visible_message("<span class='warning'>[usr] kicks the display case.</span>")
		damage_health(2, DAMAGE_BRUTE)
