/obj/item/storage/briefcase/psinull
	name = "\improper Foundation psi-null case"
	desc = "A handsome black case designed for carry psi-null implants by Cuchulain Foundation."
	w_class = ITEM_SIZE_LARGE
	icon = 'proxima/icons/obj/storage.dmi'
	icon_state = "psicase"
	item_state = "psicase"

/obj/item/storage/briefcase/psinull/New()
	..()
	new /obj/item/implantcase/psi(src)
	new /obj/item/implantcase/psi(src)
	new /obj/item/implantcase/psi(src)
	new /obj/item/implanter/psi(src)
	new /obj/item/implantpad(src)
	make_exact_fit()

/obj/item/storage/briefcase/guncase
	name = "\improper SCG pistol case"
	desc = "A handsome black case designed with blue stripes for carry gun Sol Central Government personnel."
	w_class = ITEM_SIZE_LARGE
	icon = 'proxima/icons/obj/storage.dmi'
	icon_state = "guncase_pistol"
	item_state = "guncase_pistol"

/obj/item/storage/briefcase/guncase/tar6
	name = "\improper TAR-6 pistol case"
	desc = "A handsome black case designed with blue stripes for carry TAR6 pistol of Sol Central Government personnel."

/obj/item/storage/briefcase/guncase/tar6/New()
	..()
	new /obj/item/gun/projectile/pistol/tar6/empty(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)
	make_exact_fit()

/obj/item/storage/briefcase/guncase/barrakuda
	name = "\improper K342 rifle case"
	desc = "A handsome black case designed with red stripes for carry K342 Barrakuda of Sol Central Government personnel."
	icon_state = "guncase_rifle"
	item_state = "guncase_rifle"

/obj/item/storage/briefcase/guncase/barrakuda/New()
	..()
	new /obj/item/gun/energy/k342/sol/empty(src)
	new /obj/item/cell/guncell/medium(src)
	new /obj/item/cell/guncell/medium(src)
	new /obj/item/cell/guncell/medium(src)
	make_exact_fit()
