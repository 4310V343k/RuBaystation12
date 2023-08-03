/datum/reagent/bicaridine/tobacco
	taste_description = "speeding up time?"

/datum/reagent/tobacco/perception
	name = "Herbal drugs and tobacco"
	description = "Cut and process tobacco leaves along with herbal preparations."
	taste_description = "tobacco"
	scent = "cigarette smoke and herbal drug?"
	scent_range = 6

/datum/reagent/tobacco/perception/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.add_chemical_effect(CE_SLOWDOWN, 1)

/datum/reagent/tobacco/medical
	name = "Medical tobacco"
	description = "medicinal tobacco used for relaxation and concentration."
	taste_description = "relax, concetration and tobacco"
	scent = "tobacco"
	scent_range = 2

/datum/reagent/tobacco/strong
	name = "Strong tobacco"
	description = "Strong tobacco for strong men... or women, i don't know"
	taste_description = "strong tobacco that hits the throat hard"
	scent = "strong tobacco"
	scent_range = 10

/datum/reagent/tobacco/strong/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 10)

/datum/reagent/tobacco/female
	name = "female tobacco"
	description = "female tobacco for good lady's"
	taste_description = "weak tobacco that gently caresses the throat."
	scent = "weak tobacco"

/datum/reagent/tobacco/honey
	name = "tobacco with honey"
	description = "tobacco that has been processed in honey"
	taste_description = "the sweetness of honey and the strength of tobacco."
	scent = "sweet tobacco"

/datum/reagent/tobacco/coffee
	name = "tobacco with coffee"
	description = "tobacco leaves that have been mixed with coffee powder"
	taste_description = "sweet tobacco and energetic coffee."
	scent = "sweet tobacco and energy tobacco"



//packet

/obj/item/tobacco
	name = "Peace of tobacco"
	desc = "Tobacco who used in hookah's for make smoke"
	w_class = ITEM_SIZE_TINY

	icon = 'icons/obj/hydroponics_products.dmi'
	icon_state = "tobacco-product"
	item_state = "tobacco-product"
	var/volume = 5
	var/list/filling = list(/datum/reagent/tobacco = 1)


/obj/item/tobacco/New()
	..()
	create_reagents(volume)
	for(var/R in filling)
		reagents.add_reagent(R, filling[R])

/obj/item/tobacco/perception
	name = "perception tobacco"
	desc = "Cut and process tobacco leaves along with herbal preparations."

	filling = list(/datum/reagent/tobacco/perception = 1, /datum/reagent/bicaridine/tobacco = 1)

/obj/item/tobacco/medical
	name = "medical tobacco"
	desc = "Medicinal tobacco used for relaxation and concentration."

	filling = list(/datum/reagent/tobacco/medical = 1, /datum/reagent/paroxetine = 0.7)

/obj/item/tobacco/strong
	name = "strong tobacco"
	desc = "Strong tobacco for strong men... or women, perhaps."

	filling = list(/datum/reagent/tobacco/strong = 1)

/obj/item/tobacco/female
	name = "female tobacco"
	desc = "Female tobacco for good lady's."

	filling = list(/datum/reagent/tobacco/female = 1)

/obj/item/tobacco/honey
	name = "tobacco with honey"
	desc = "Tobacco that has been processed in honey."

	filling = list(/datum/reagent/tobacco/honey = 1)

/obj/item/tobacco/coffee
	name = "tobacco with coffee"
	desc = "Tobacco leaves that have been mixed with coffee powder."

	filling = list(/datum/reagent/tobacco/coffee = 1)

/obj/item/tobacco/attackby(obj/item/I, mob/user)
	if(is_type_in_list(I, list(/obj/item/paper/cig/, /obj/item/paper/, /obj/item/teleportation_scroll)))
		if(user.unEquip(I))
			var/obj/item/clothing/mask/smokable/cigarette/rolled/R = new(get_turf(src))
			R.chem_volume = reagents.total_volume
			R.brand = "[src] handrolled in \the [I]."
			reagents.trans_to_holder(R.reagents, R.chem_volume)
			to_chat(user, "<span class='notice'>You roll \the [src] into \the [I]</span>")
			user.put_in_active_hand(R)
			qdel(I)
			qdel(src)
			return
	..()

/obj/item/storage/chewables/rollable/perception
	name = "bag of perception tobacco"
	desc = "Cut and process tobacco leaves along with herbal preparations."
	startswith = list(/obj/item/tobacco/perception = 8)
	icon_state = "rollfine"

/obj/item/storage/chewables/rollable/medical
	name = "bag of medical tobacco"
	desc = "Medicinal tobacco used for relaxation and concentration."
	startswith = list(/obj/item/tobacco/medical = 8)
	icon_state = "rollfine"

/obj/item/storage/chewables/rollable/strong
	name = "bag of strong tobacco"
	desc = "Strong tobacco for strong men... or women, perhaps."
	startswith = list(/obj/item/tobacco/strong = 8)
	icon_state = "rollfine"

/obj/item/storage/chewables/rollable/female
	name = "bag of female tobacco"
	desc = "Female tobacco for good lady's."
	startswith = list(/obj/item/tobacco/female = 8)
	icon_state = "rollfine"

/obj/item/storage/chewables/rollable/honey
	name = "bag of honey tobacco"
	desc = "Tobacco that has been processed in honey."
	startswith = list(/obj/item/tobacco/honey = 8)
	icon_state = "rollfine"

/obj/item/storage/chewables/rollable/coffee
	name = "bag of coffee tobacco"
	desc = "Tobacco leaves that have been mixed with coffee powder."
	startswith = list(/obj/item/tobacco/coffee = 8)
	icon_state = "rollfine"
