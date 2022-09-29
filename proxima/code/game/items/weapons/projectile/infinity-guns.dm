/obj/item/gun/projectile/automatic/corpo
	name = "SN42"
	desc = "The SN42 Enforcer or simply Syndie 42 is a self-defense weapon made on bullpup system. Formely produced by Syndicate for it's Corporate Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 6mmR rounds."
	icon_state = "nt41"
	item_state = "nt41"
	icon = 'proxima/icons/obj/guns/guns.dmi'
	wielded_item_state = "nt41-wielded"
	item_icons = list(
		slot_r_hand_str = 'proxima/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'proxima/icons/mob/onmob/lefthand.dmi',
		)

	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/corpo
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/corpo
	allowed_magazines = /obj/item/ammo_magazine/corpo
	screen_shake = 0.5 //SMG

	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=0, move_delay=null),
		list(mode_name="2-round bursts", mode_desc = "Short, controlled bursts", burst=2, fire_delay=null, move_delay=2, one_hand_penalty=2),
		list(mode_name="3-round bursts", mode_desc = "Short, controlled bursts", burst=3, fire_delay=null, move_delay=4, one_hand_penalty=3),
		list(mode_name = "full auto",  mode_desc = "600 rounds per minute",   mode_type = /datum/firemode/automatic, fire_delay = 2, one_hand_penalty=4)
		)

	bulk = GUN_BULK_RIFLE - 1
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 2

/obj/item/gun/projectile/automatic/nt41/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "nt41" : "nt41-e"

/obj/item/gun/projectile/automatic/amrcarabine
	name = "LDC-542"
	desc = "A 'silent' and deadly gun, formely manufactured by Syndicate. It's a common weapon for a long-medium ranged combat units in Private Military Companies. Uses 12mmR rounds. Fuck, is this even legal?"
	icon = 'proxima/icons/obj/guns/guns.dmi'
	icon_state = "amrcarabine"
	item_state = "z8carbine"
	force = 10
	caliber = CALIBER_ANTIMATERIAL_SMALL
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/amr
	allowed_magazines = /obj/item/ammo_magazine/amr
	ammo_type = /obj/item/ammo_casing/amr
	wielded_item_state = "z8carbine-wielded"
	burst_delay = 2
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=1, move_delay=null),
		list(mode_name="2-round bursts", mode_desc = "Short, controlled bursts", burst=2, fire_delay=null, move_delay=2, one_hand_penalty=2),
		list(mode_name = "full auto",  mode_desc = "400 rounds per minute",   mode_type = /datum/firemode/automatic, fire_delay = 4, one_hand_penalty=3)
		)

	bulk = GUN_BULK_RIFLE
	w_class = ITEM_SIZE_HUGE
	one_hand_penalty = 7

/obj/item/gun/projectile/automatic/amrcarabine/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "amrcarabine" : "amrcarabine-e"


/obj/item/gun/projectile/automatic/pdw
	name = "BP-15"
	desc = "The BP-15 'Moloh' is a personal defense weapon, produced by Hephaestus Industries for use by police spec ops or solders. Uses 6mmR rounds."
	icon = 'proxima/icons/obj/guns/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		)
	caliber = CALIBER_PISTOL_FAST
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/pdw
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/pdw
	allowed_magazines = /obj/item/ammo_magazine/pdw

	//machine pistol, like SMG but easier to one-hand with
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=0, move_delay=null),
		list(mode_name="3-round bursts", mode_desc = "Short, controlled bursts", burst=3, fire_delay=null, move_delay=4, one_hand_penalty=3),
		list(mode_name="5-round bursts", mode_desc = "Short, controlled bursts", burst=5, fire_delay=null, move_delay=6, one_hand_penalty=3),
		list(mode_name = "fuller auto",  mode_desc = "800 rounds per minute",   mode_type = /datum/firemode/automatic, fire_delay = 1, one_hand_penalty=5)
		)

	bulk = GUN_BULK_RIFLE - 3
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 3

/obj/item/gun/projectile/automatic/bp15/on_update_icon()
	icon_state = (ammo_magazine)? "pdw" : "pdw-empty"
	..()

/obj/item/gun/projectile/automatic/corpo/sec
	name = "SN42-Smart"
	desc = "The SN42 Enforcer variant or simply Syndie 42 is a self-defense weapon made on bullpup system. Formely produced by Syndicate for it's Corporate Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 6mmR rounds."
	authorized_modes = list(UNAUTHORIZED)
