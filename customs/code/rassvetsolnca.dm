/obj/item/gun/projectile/revolver/rassvetsolnca
	name = "Revolver 'Saitako'"
	desc = "This is a very reliable revolver, custom made for a specific person. The caliber of the gun is .357, be careful when interacting with it. It was made by a private manufacturer - Saitako. You may notice the Yangui characters on the grip."
	icon = 'proxima/icons/obj/guns/ballistic.dmi'
	icon_state = "detective_panther"
	handle_casings = CYCLE_CASINGS
	caliber = CALIBER_PISTOL
	max_shells = 6
	ammo_type = list(/obj/item/ammo_casing/pistol/small, /obj/item/ammo_casing/pistol/small/rubber)

/obj/item/storage/secure/briefcase/rassvetsolnca
	l_code = "12345"
	l_set = 1
	startswith = list(
		/obj/item/gun/projectile/revolver/rassvetsolnca,
		/obj/item/speedloader/small/rubber,
		/obj/item/speedloader/small/rubber,
		/obj/item/speedloader/small/rubber,
		/obj/item/speedloader/small/rubber,
	)
