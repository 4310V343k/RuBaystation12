/obj/item/storage/pouch
	name = "pouch"
	desc = "Can hold various things."
	icon = 'proxima/icons/obj/clothing/icon.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	cant_hold = list(/obj/item/storage/pouch) //Pouches in pouches was a misstake

	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT //Pouches can be worn on belt
	storage_slots = 1
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_BOX_STORAGE
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")
	var/sliding_behavior = FALSE

/obj/item/storage/pouch/verb/toggle_slide()
	set name = "Toggle Slide"
	set desc = "Toggle the behavior of last item in [src] \"sliding\" into your hand."
	set category = "Object"

	sliding_behavior = !sliding_behavior
	to_chat(usr, SPAN_NOTICE("Items will now [sliding_behavior ? "" : "not"] slide out of [src]"))

/obj/item/storage/pouch/attack_hand(mob/living/carbon/human/user)
	if(sliding_behavior && contents.len && (src in user))
		slide_out_item(user)
	else
		..()

/obj/item/storage/pouch/proc/slide_out_item(mob/living/carbon/human/user)
	var/obj/item/I = contents[contents.len]
	if(istype(I))
		hide_from(usr)
		var/turf/T = get_turf(user)
		remove_from_storage(I, T)
		usr.put_in_hands(I)
		add_fingerprint(user)

/obj/item/storage/pouch/small_generic
	name = "small generic pouch"
	desc = "Can hold nearly anything in it, but only a small amount."
	icon_state = "small_generic"
	item_state = "small_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_BOX_STORAGE * 0.5
	max_w_class = ITEM_SIZE_TINY
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/storage/pouch/small_generic/purple
	icon_state = "small_generic_p"
	item_state = "small_generic_p"

/obj/item/storage/pouch/small_generic/leather
	icon_state = "small_leather"
	item_state = "small_leather"

/obj/item/storage/pouch/medium_generic
	name = "medium generic pouch"
	desc = "Can hold nearly anything in it, but only a moderate amount."
	icon_state = "medium_generic"
	item_state = "medium_generic"
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	max_w_class = ITEM_SIZE_SMALL

/obj/item/storage/pouch/medium_generic/leather
	icon_state = "medium_leather"
	item_state = "medium leather"

/obj/item/storage/pouch/large_generic
	name = "large generic pouch"
	desc = "A mini satchel. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_generic"
	item_state = "large_generic"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	max_w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/storage/pouch/large_generic/leather
	desc = "A mini satchel made of leather. Can hold a fair bit, but it won't fit in your pocket"
	icon_state = "large_leather"
	item_state = "large_leather"


/obj/item/storage/pouch/medical_supply
	name = "medical supply pouch"
	desc = "Can hold medical equipment. But only about four pieces of it."
	icon_state = "medical_supply"
	item_state = "medical_supply"

	storage_slots = 4
	max_w_class = ITEM_SIZE_SMALL

	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health
		)

/obj/item/storage/pouch/engineering_tools
	name = "engineering tools pouch"
	desc = "Can hold small engineering tools. But only about four pieces of them."
	icon_state = "engineering_tool"
	item_state = "engineering_tool"

	storage_slots = 4
	max_w_class = ITEM_SIZE_SMALL

	can_hold = list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/device/flashlight,
		/obj/item/device/radio/headset,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini,
		/obj/item/hand_labeler,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses
		)

/obj/item/storage/pouch/engineering_supply
	name = "engineering supply pouch"
	desc = "Can hold engineering equipment. But only about three pieces of it."
	icon_state = "engineering_supply"
	item_state = "engineering_supply"

	storage_slots = 3
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/stack/material,
		/obj/item/material,
		/obj/item/stack/material/rods,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/scanner/gas,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/extinguisher/mini,
		/obj/item/airlock_electronics,
		/obj/item/airalarm_electronics,
		)

/obj/item/storage/pouch/janitor_supply
	name = "janitorial supply pouch"
	desc = "Can hold janitorial equipment, but only about four pieces of them."
	icon_state = "janitor_supply"
	item_state = "janitor_supply"

	storage_slots = 4
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/grenade/chem_grenade/cleaner,
		/obj/item/grenade/chem_grenade/antiweed,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/device/assembly/mousetrap,
		/obj/item/device/scanner/plant,
		/obj/item/extinguisher/mini
		)

/obj/item/storage/pouch/ammo
	name = "ammo pouch"
	desc = "Can hold ammo magazines and bullets, not the boxes though."
	icon_state = "ammo"
	item_state = "ammo"

	storage_slots = 6
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing
		)

/obj/item/storage/pouch/tubular
	name = "tubular pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets."
	icon_state = "flare"
	item_state = "flare"

	storage_slots = 7
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/melee/baton,
		/obj/item/device/flashlight/flare/glowstick,
		/obj/item/device/flashlight,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker/vial,
		/obj/item/reagent_containers/hypospray,
		/obj/item/pen,
		/obj/item/storage/pill_bottle,
		/obj/item/extinguisher,
		/obj/item/ammo_casing/shotgun,
		/obj/item/grenade,
		)

/obj/item/storage/pouch/tubular/vial
	name = "vial pouch"
	desc = "Can hold seven cylindrical and small items, including but not limiting to flares, glowsticks, syringes and even hatton tubes or rockets. Tho the branding on this wants you to only really use it with vial."


/obj/item/storage/pouch/tubular/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += (image('proxima/icons/obj/clothing/icon.dmi', "flare_[contents.len]"))


/obj/item/storage/pouch/pistol_holster
	name = "pistol holster"
	desc = "Can hold a handgun in."
	icon_state = "pistol_holster"
	item_state = "pistol_holster"
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = 1
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/gun/projectile/pistol,
		/obj/item/gun/energy/ionrifle/small,
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/energy/xray/pistol,
		/obj/item/gun/energy/incendiary_laser,
		/obj/item/gun/energy/k342/pistol
		)

	cant_hold = list(/obj/item/storage/pouch,
					 /obj/item/gun/energy/gun/nuclear
					 )


	sliding_behavior = TRUE

/obj/item/storage/pouch/pistol_holster/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += (image('proxima/icons/obj/clothing/icon.dmi', "pistol_layer"))

/obj/item/storage/pouch/pistol_holster/cowboy
	name = "belt holster"
	desc = "Can hold two handguns in. Quick on the draw!"
	icon_state = "double_holster"
	item_state = "double_holster"
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	matter = list(MATERIAL_BIOMATTER = 24) // Two holsters in one!
	slot_flags = SLOT_BELT|SLOT_DENYPOCKET
	max_w_class = ITEM_SIZE_HUGE
	storage_slots = 2

/obj/item/storage/pouch/pistol_holster/cowboy/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += (image('proxima/icons/obj/clothing/icon.dmi', "gun_[contents.len]"))

/obj/item/storage/pouch/kniferig
	name = "throwing knife rig"
	desc = "A rig for professionals at knife throwing."
	icon_state = "kniferig"
	item_state = "kniferig"
	storage_slots = 4 // 12 knives total counting stacks
	can_hold = list(
		/obj/item/material/knife/combat
		)

/obj/item/storage/pouch/kniferig/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += (image('proxima/icons/obj/clothing/icon.dmi', "knife_[contents.len]"))


/obj/item/storage/pouch/baton_holster
	name = "baton sheath"
	desc = "Can hold a baton, or indeed most shafts."
	icon_state = "baton_holster"
	item_state = "baton_holster"
	storage_slots = 1
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/melee/baton,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/device/flashlight,
		/obj/item/reagent_containers/glass/bottle
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/baton_holster/telebaton

/obj/item/storage/pouch/baton_holster/telebaton/New()
	new/obj/item/melee/telebaton(src)
	update_icon()
	. = ..()

/obj/item/storage/pouch/baton_holster/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += (image('proxima/icons/obj/clothing/icon.dmi', "baton_layer"))
