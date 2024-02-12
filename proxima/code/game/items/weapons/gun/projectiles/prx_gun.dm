/obj/item/gun/projectile/pistol/tar6
	name = "military pistol"
	desc = "The Hephaestus Industries TAR-6 - a mass produced kinetic sidearm in widespread service with the SCGDF."
	caliber = CALIBER_PISTOL
	magazine_type = /obj/item/ammo_magazine/pistol
	icon = 'proxima/icons/obj/guns/tar6.dmi'
	icon_state = "tar6"
	item_state = "tar6"
	has_safety = TRUE
	safety_icon = "safety"
	auto_eject = TRUE
	auto_eject_sound = 'sound/weapons/sol_pistol_empty_alarm.ogg'
	fire_delay = 6
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/lefthand.dmi',
		)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_ENGINEERING = 1)
	fire_delay = 7

/obj/item/gun/projectile/pistol/tar6/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "tar6" : "tar6-e"

/obj/item/gun/projectile/pistol/tar6/empty
	starts_loaded = FALSE

/obj/item/gun/projectile/automatic/sc42
	name = "SC-42 carabine"
	desc = "SC-42 carabine - These are weapons specially designed to resolve conflicts on the streets without attracting unnecessary attention. By integrating a silencer, it is mainly used by the military police of the SCG."
	icon = 'proxima/icons/obj/guns/arg75.dmi'
	icon_state = "arg75"
	item_state = "arifle"
	wielded_item_state = "arifle-wielded"
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/items/guns_r_default.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/items/guns_l_default.dmi',
		)
	fire_delay = 4
	caliber = CALIBER_CARABINE
	ammo_type = /obj/item/ammo_casing/rifle/carabine
	magazine_type = /obj/item/ammo_magazine/carabine_rifle
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/carabine_rifle
	silenced = TRUE
	multi_aim = 1
	can_special_reload = TRUE
	firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=0, move_delay=null),
		list(mode_name="2-round bursts", mode_desc = "Short, controlled bursts", burst=2, fire_delay=null, move_delay=2, one_hand_penalty=2),
		list(mode_name="3-round bursts", mode_desc = "Short, controlled bursts", burst=3, fire_delay=null, move_delay=4, one_hand_penalty=3)
		)

/obj/item/gun/projectile/automatic/sc42/on_update_icon()
	..()
	icon_state = "arg75"
	if(ammo_magazine)
		overlays += image(icon, "arg75_mag")

/obj/item/ammo_magazine/carabine_rifle
	name = "carabine rifle magazine"
	icon = 'proxima/icons/obj/ammo.dmi'
	icon_state = "carabine"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_CARABINE
	matter = list(MATERIAL_STEEL = 1400)
	ammo_type = /obj/item/ammo_casing/rifle/carabine
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_casing/rifle/carabine
	desc = "A SC-42 carabine casing."
	caliber = CALIBER_CARABINE
	projectile_type = /obj/item/projectile/bullet/rifle/carabine
	icon_state = "rifle_mil"
	spent_icon = "rifle_mil-spent"

/obj/item/projectile/bullet/rifle/carabine
	fire_sound = 'sound/weapons/gunshot/gunshot3.ogg'
	damage = 35
	armor_penetration = 30
	penetration_modifier = 1
	penetrating = 0 //INF, WAS 1
