/obj/item/toy/figure/poraz
	icon = 'proxima/icons/obj/toys.dmi'
	name = "Mr. Poraz figure"
	desc = "A relatively small statuette of a certain unati in a poncho and a cheerful hat. \"Mr. Poraz\" is engraved on the rim of the hat."
	icon_state = "poraz"

/obj/structure/sign/poster/custompost
	name = "poster"
	icon = 'proxima/icons/obj/posters.dmi'
	icon_state="customposter"

/obj/structure/sign/poster/custompost/New()
	if(!poster_type)
		poster_type = pick(subtypesof(/decl/poster/custompost))
	..()
/decl/poster/custompost/poraz
	icon_state="poraz_poster"
	name = "Cheerfulness"
	desc = "Cheerfulness is an important human quality."
