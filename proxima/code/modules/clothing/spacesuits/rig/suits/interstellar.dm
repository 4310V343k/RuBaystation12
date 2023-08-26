/obj/item/rig/interstellar //INF-PORT
	name = "interstellar HCM"
	desc = "Armored RIG is specially designed to work in extreme conditions and is designed mainly to protect against near-range damage."
	icon_state = "interstellar_rig"
	suit_type = "interstellar hardsuit"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	online_slowdown = 0.75
	offline_slowdown = 1
	offline_vision_restriction = TINT_HEAVY
	allowed = list(/obj/item/device/flashlight, /obj/item/tank,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/handcuffs,/obj/item/device/t_scanner, /obj/item/rcd, /obj/item/crowbar, \
	/obj/item/screwdriver, /obj/item/weldingtool, /obj/item/wirecutters, /obj/item/wrench, /obj/item/device/multitool, \
	/obj/item/device/radio, /obj/item/device/scanner/gas,/obj/item/storage/briefcase/inflatable, /obj/item/melee/baton, /obj/item/gun, \
	/obj/item/storage/firstaid, /obj/item/reagent_containers/hypospray, /obj/item/roller, /obj/item/device/suit_cooling_unit)

	chest_type = /obj/item/clothing/suit/space/rig/interstellar
	helm_type = /obj/item/clothing/head/helmet/space/rig/interstellar
	boot_type = /obj/item/clothing/shoes/magboots/rig/interstellar
	glove_type = /obj/item/clothing/gloves/rig/interstellar

	initial_modules = list(
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/chem_dispenser/lite,
		/obj/item/rig_module/grenade_launcher/light
		)

	req_access = list(access_explorer)

/obj/item/clothing/head/helmet/space/rig/interstellar
	light_overlay = "helmet_light_dual_green"

	icon = 'proxima/icons/obj/clothing/obj_head.dmi'
	item_icons = list(
		slot_head_str = 'proxima/icons/mob/onmob/onmob_head.dmi'
	)

	species_restricted = list(SPECIES_HUMAN,SPECIES_IPC)
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_unathi.dmi'
		)

/obj/item/clothing/suit/space/rig/interstellar

	icon = 'proxima/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(
		slot_wear_suit_str = 'proxima/icons/mob/onmob/onmob_suit.dmi'
	)

	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_IPC)
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_suit_unathi.dmi'
		)

/obj/item/clothing/shoes/magboots/rig/interstellar

	icon = 'proxima/icons/obj/clothing/obj_feet.dmi'
	item_icons = list(
		slot_shoes_str = 'proxima/icons/mob/onmob/onmob_feet.dmi'
	)

	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_IPC)
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_feet_unathi.dmi'
		)

/obj/item/clothing/gloves/rig/interstellar

	icon = 'proxima/icons/obj/clothing/obj_hands.dmi'
	item_icons = list(
		slot_gloves_str = 'proxima/icons/mob/onmob/onmob_hands.dmi'
	)

	item_flags = ITEM_FLAG_THICKMATERIAL
	species_restricted = list(SPECIES_HUMAN,SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_IPC)
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_hands_unathi.dmi'
		)
