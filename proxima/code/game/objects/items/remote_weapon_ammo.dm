/obj/item/remote_weapon_ammo
	name = "bluespace rocket"
	desc = "A rocket used by remote bluespace rocket launchers."
	icon = 'proxima/icons/obj/shell.dmi'
	icon_state = "mortar_ammo_he"
	w_class = ITEM_SIZE_NORMAL
	/// Sound played when fired
	var/fire_sound = 'sound/weapons/gunship_rocketpod.ogg'
	/// Time it takes for the rocket to actually arrive
	var/attack_delay = 5 SECONDS

/// Called by remote weapon when firing the shell
/obj/item/remote_weapon_ammo/proc/FireSelf(turf/target)
	qdel(src)
	return

// Explosives
/obj/item/remote_weapon_ammo/explosive
	name = "bluespace HE rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This one produces a potent explosion upon landing."
	icon_state = "mortar_ammo_he"
	var/explosion_high = 2
	var/explosion_medium = 4
	var/explosion_light = 6
	var/explosion_flash = 8

/obj/item/remote_weapon_ammo/explosive/FireSelf(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 100, TRUE, 4)
	sleep(7)
	explosion(target, explosion_high, explosion_medium, explosion_light, explosion_flash)
	return ..()

/obj/item/remote_weapon_ammo/explosive/low
	name = "bluespace LE rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This one produces a relatively weak explosion upon landing."
	icon_state = "mortar_ammo_he"
	explosion_high = -1
	explosion_medium = 2
	explosion_light = 5
	explosion_flash = 6


/obj/item/remote_weapon_ammo/explosive/illumination
	name = "bluespace illumination rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This thing produces a reaction with gorenje chemicals that illuminates a large area."
	icon_state = "mortar_ammo_flr"
	explosion_high = 0
	explosion_medium = 0
	explosion_light = 0
	explosion_flash = 0


/obj/item/remote_weapon_ammo/explosive/illimination/FireSelf(turf/target)
	..()
	var/lifetime = rand(8 MINUTES, 16 MINUTES)
	var/light_colour = pick("#ffffff", "#fc0f29")

	playsound(src, 'sound/effects/snap.ogg', 80, 1)
	audible_message("<span class='warning'>\The [src] detonates with a sharp crack!</span>")
	set_light(20, 20, 120, 0, light_colour)
	QDEL_IN(src, lifetime)
