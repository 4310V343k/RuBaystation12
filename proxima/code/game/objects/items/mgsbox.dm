//snake? snake! SNAKE?!!!!!!!!!!
/obj/item/storage/mgsbox
	name = "cardboard box"
	icon = 'proxima/icons/obj/box.dmi'
	icon_state = "box"
	desc = "Just ordinary and absolutely unsuspicious box."
	w_class = ITEM_SIZE_NO_CONTAINER
	max_w_class = ITEM_SIZE_GARGANTUAN
	max_storage_space = 40
	allow_quick_empty = 1
	allow_quick_gather = 1
	randpixel = 2

	var/open = 0
	var/stealth_mode = 0
	var/sprite = "box"
	var/sprite_open = "box-open"
	var/taping_level = 0
	var/obj/effect/dummy/box/active_dummy = null
	var/image/overlay

/obj/item/storage/mgsbox/AltClick(mob/usr)
	if(!(src in view(1, usr)))
		return

	if(stealth_mode == 1)
		to_chat(usr, SPAN_WARNING("You can't do it while in box!"))
		return

	if(taping_level == 1)
		to_chat(usr, SPAN_NOTICE("You begin to remove duct tape from the box..."))
		if(do_after(usr, 6 SECONDS, src, DO_SHOW_PROGRESS | DO_PUBLIC_PROGRESS | DO_BAR_OVER_USER))
			to_chat(usr, SPAN_NOTICE("You're done removing the duct tape, now you can open the box."))
			taping_level = 0
			src.overlays -= overlay
		return
	else if(taping_level == 2)
		to_chat(usr, SPAN_WARNING("There so much duct tape - you even can't open the box! Maybe just break it?.."))
		return

	if(open == 0)
		to_chat(usr, SPAN_NOTICE("You open the box."))
		open = 1
		icon_state = sprite_open
		playsound(src, 'sound/effects/storage/box.ogg', 50, 1)
	else
		to_chat(usr, SPAN_NOTICE("You close the box."))
		open = 0
		icon_state = sprite

/obj/item/storage/mgsbox/proc/is_open()
	if(stealth_mode == 1)
		to_chat(usr, SPAN_WARNING("You can't do it while in box!"))
		return 0

	if(open == 0)
		to_chat(usr, SPAN_NOTICE("You need to open the box."))
		return 0
	else
		return 1

/obj/item/storage/mgsbox/proc/taping()
	if(taping_level == 0)
		to_chat(usr, SPAN_NOTICE("You begin to taping the box..."))
		playsound(src, 'sound/effects/tape.ogg', 25)
		if(do_after(usr, 5 SECONDS, src, DO_SHOW_PROGRESS | DO_PUBLIC_PROGRESS | DO_BAR_OVER_USER))
			to_chat(usr, SPAN_NOTICE("You finish taping of the box. You can tape once more, but then it will be impossible to open this box."))
			taping_level = 1
			overlay = image(icon, icon_state = "taping_level1")
			src.overlays += overlay
	else if(taping_level == 1)
		to_chat(usr, SPAN_NOTICE("You begin to taping the box..."))
		playsound(src, 'sound/effects/tape.ogg', 25)
		if(do_after(usr, 7 SECONDS, src, DO_SHOW_PROGRESS | DO_PUBLIC_PROGRESS | DO_BAR_OVER_USER))
			to_chat(usr, SPAN_NOTICE("This box is now fully secured by duct tape."))
			taping_level = 2
			src.overlays -= overlay
			overlay = image(icon, icon_state = "taping_level2")
			src.overlays += overlay
	else
		to_chat(usr, SPAN_WARNING("You don't know where else possible to stick the duct tape here."))

/obj/item/storage/mgsbox/attackby(obj/item/W, mob/user)
	if((istype(W, /obj/item/tape_roll)) && (open == 0) && (stealth_mode == 0))
		taping()
		return

	if((istype(W, /obj/item/crowbar)) || (istype(W, /obj/item/melee)) || (istype(W, /obj/item/material/twohanded)) || (istype(W, /obj/item/material/hatchet)) || (istype(W, /obj/item/material/sword)))
		if(usr.a_intent == I_HURT)
			playsound(src, 'sound/weapons/pierce.ogg', 75)
			quick_empty()
			visible_message(SPAN_WARNING("[usr] breaks the box with [W]!"))
			new /obj/item/stack/material/cardboard(src.loc)
			new /obj/item/stack/material/cardboard(src.loc)
			qdel(src)
			return

	if(is_open())
		. = ..() //When open work like ordinary storage. Same with commands below
	else
		return

/obj/item/storage/mgsbox/MouseDrop(obj/over_object as obj)
	if(is_open())
		. = ..()
	else
		return

/obj/item/storage/mgsbox/attack_hand(mob/user as mob)
	if(is_open())
		. = ..()
	else
		usr.put_in_active_hand(src)

/obj/item/storage/mgsbox/quick_empty()
	if(is_open())
		. = ..()
	else
		return

/obj/item/storage/mgsbox/toggle_gathering_mode()
	if(is_open())
		. = ..()
	else
		return

/obj/item/storage/mgsbox/examine(mob/user, distance)
	. = ..(user)
	if(distance <= 2)
		if(taping_level == 1)
			to_chat(usr, SPAN_NOTICE("You notice that this box is secured with duct tape."))
		else if(taping_level == 2)
			to_chat(usr, SPAN_NOTICE("You notice that this box is taped in every possible place."))
/*

	Here's to you, Nicola and Bart
	Rest Forever here in our hearts
	The last and final moment is yours
	That agony is your triumph
*/

/************
* Other boxes
*************/
/obj/item/storage/mgsbox/lpa
	name = "cardboard box"
	icon = 'proxima/icons/obj/box.dmi'
	icon_state = "boxlpa"
	desc = "Not ordinary and prety suspicious box."

	sprite = "boxlpa"
	sprite_open = "boxlpa-open"

/obj/item/storage/mgsbox/med
	name = "cardboard box"
	icon = 'proxima/icons/obj/box.dmi'
	icon_state = "boxmed"
	desc = "A blue cardboard box with medical symbols. Destruction of this box probably violate the Moon Convention."

	sprite = "boxmed"
	sprite_open = "boxmed-open"

/obj/item/storage/mgsbox/clear
	name = "cardboard box"
	icon = 'proxima/icons/obj/box.dmi'
	icon_state = "boxclear"
	desc = "A cardboard box without any symbols. Probably hand-made."

	sprite = "boxclear"
	sprite_open = "boxclear-open"


/****************
* Boxes with loot
****************/
/obj/item/storage/mgsbox/med/loot_medicaments
	startswith = list(/obj/random/firstaid, /obj/random/medical, /obj/random/medical)

/obj/item/storage/mgsbox/loot_material
	startswith = list(/obj/random/material, /obj/random/tool, /obj/random/maintenance, /obj/random/maintenance)

/obj/item/storage/mgsbox/loot_engineering
	startswith = list(/obj/random/toolbox, /obj/item/stack/cable_coil/random, /obj/item/stack/cable_coil/random, /obj/random/maintenance)

/obj/item/storage/mgsbox/loot_accesory
	startswith = list(/obj/random/clothing, /obj/random/accessory, /obj/random/accessory, /obj/random/masks, /obj/random/hat)

/obj/item/storage/mgsbox/loot_meal
	startswith = list(/obj/item/storage/mre/random, /obj/random/drinkbottle, /obj/random/snack, /obj/random/single/cola)
