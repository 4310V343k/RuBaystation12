/obj/item/projectile/plasma
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	fire_sound='proxima/sound/weapons/guns/incinerate.ogg'
	armor_penetration = 25
	damage = 33
	damage_type = BURN

	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact

/obj/item/projectile/plasma/heavy
	name = "heavy plasma bolt"
	fire_sound='proxima/sound/weapons/guns/vaporize.ogg'
	damage = 50
	armor_penetration = 50

/obj/item/projectile/plasma/stun
	name = "stun plasma bolt"
	fire_sound='proxima/sound/weapons/guns/burn.ogg'
	damage = 2
	agony = 40
	eyeblur = 1
	damage_type = BURN
	impact_type = /obj/effect/projectile/stun/impact

/obj/effect/projectile/plasma
	light_color = COLOR_BLUE

/obj/effect/projectile/plasma/muzzle
	icon_state = "muzzle_plasma"

/obj/effect/projectile/plasma/impact
	icon_state = "impact_plasma"

/obj/item/gun/energy/k342
	name = "K342 - Barrakuda"
	desc = "Factory-new weapon"
	icon = 'proxima/icons/obj/guns/k342.dmi'
	item_icons = list(
		slot_l_hand_str = 'proxima/icons/mob/onmob/items/lefthand-guns.dmi',
		slot_r_hand_str = 'proxima/icons/mob/onmob/items/righthand-guns.dmi',
		slot_back_str = 'proxima/icons/mob/onmob/items/back-guns.dmi'
		)
	slot_flags = SLOT_BACK|SLOT_BELT
	icon_state = "lasergun_off"
	item_state = "lasergun"
	wielded_item_state = "lasergun-wielded"
	battery_changable = TRUE
	req_access = list(list(access_brig, access_bridge))
	authorized_modes = list(ALWAYS_AUTHORIZED, AUTHORIZED)
	init_firemodes = list(
		list(mode_name="stun bean", projectile_type=/obj/item/projectile/plasma/stun, charge_cost=20, fire_delay=4, projectile_color=COLOR_YELLOW),
		list(mode_name="plasma bean", projectile_rype=/obj/item/projectile/plasma, charge_cost=20, fire_delay=4, projectile_color=COLOR_BLUE_LIGHT),
		list(mode_name="heavy plasma bean", projectile_rype=/obj/item/projectile/plasma/heavy, charge_cost=40, fire_delay=8, projectile_color=COLOR_BLUE)
	)

/obj/item/gun/energy/k342/on_update_icon()
	. = ..()
	if(power_supply)
		icon_state = "lasergun_on"
		var/i = ""
		switch(power_supply.percent())
			if(70 to 100)
				i = "g_70+"
			if(35 to 69)
				i = "g_35+"
			if(0.05 to 34)
				i = "g_0+"
		if(i)
			overlays += image(icon, i)
	else
		icon_state = "lasergun_off"
