/obj/item/gun/projectile/pistol/goodman
	name = "military pistol"
	desc = "The Hephaestus Industries P20 - a mass produced kinetic sidearm in widespread service with the SCGDF."
	caliber = CALIBER_PISTOL
	magazine_type = /obj/item/ammo_magazine/pistol
	icon = 'proxima/icons/obj/guns/sol_pistol.dmi'
	icon_state = "m8"
	item_state = "m8"
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/lefthand.dmi',
		)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	fire_delay = 7

/obj/item/gun/projectile/pistol/goodman/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "adhomian_heavy_pistol" : "adhomian_heavy_pistol-e"

/obj/item/gun/projectile/pistol/magnum_pistol/sol
	name = "magnum pistol"
	desc = "The Herne-tek, just a cqc handgun that uses high-caliber ammo."
	icon = 'proxima/icons/obj/guns/adhomian_heavy_pistol.dmi'
	icon_state = "adhomian_heavy_pistol"
	item_state = "adhomian_heavy_pistol"
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/lefthand.dmi',
		)
	force = 10
	caliber = CALIBER_PISTOL_MAGNUM
	fire_delay = 5
	magazine_type = /obj/item/ammo_magazine/magnum
	accuracy = 2
	one_hand_penalty = 2
	bulk = 3

/obj/item/gun/projectile/pistol/magnum_pistol/sol/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "adhomian_heavy_pistol" : "adhomian_heavy_pistol-e"

/obj/item/gun/projectile/sniper/semistrip/stealth
	name = "stealth sniper rifle"
	desc = "it's special design weapon that was designed for stealth assassination."
	icon = 'proxima/icons/obj/guns/heavysniper.dmi'
	icon_state = "heavysniper"
	item_state = "heavysniper"
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/lefthand.dmi',
		slot_back_str = 'proxima/icons/mob/onmob/items/back-guns.dmi'
		)
	w_class = ITEM_SIZE_LARGE
	force = 10
	origin_tech = list(TECH_COMBAT = 2)
	slot_flags = SLOT_BACK
	caliber = CALIBER_PISTOL_ANTIQUE
	ammo_type = /obj/item/ammo_casing/pistol/throwback
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	accuracy = 3
	scope_zoom = 5
	scoped_accuracy = -2
	wielded_item_state = "heavysniper-wielded"
