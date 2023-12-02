/obj/item/gun/projectile/pistol/tar6
	name = "military pistol"
	desc = "The Hephaestus Industries TAR-6 - a mass produced kinetic sidearm in widespread service with the SCGDF."
	caliber = CALIBER_PISTOL
	magazine_type = /obj/item/ammo_magazine/pistol
	icon = 'proxima/icons/obj/guns/re_sol_pistol.dmi'
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
