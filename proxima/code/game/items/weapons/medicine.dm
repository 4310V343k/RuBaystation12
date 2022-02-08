/obj/item/stack/medical/tourniquet
	name = "tourniquet"
	w_class = ITEM_SIZE_SMALL//Packed very effective
	desc = "That's the generic tourniquet used to treat arterial bleeding."
	icon = 'proxima/icons/obj/tourniquet.dmi'
	icon_state = "esmarch_tourniquet"
	amount = 1
	animal_heal = 0
	var/list/tourniquetable_organs = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT)	//List of organs you can splint, natch.

/obj/item/stack/medical/tourniquet/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/stack/medical/tourniquet))
		return
	..()

/obj/item/stack/medical/tourniquet/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()
		var/limb = affecting.name
		if(!(affecting.organ_tag in tourniquetable_organs))
			to_chat(user, "<span class='danger'>You can't apply \the [src] there!</span>")
			return
		if(!(affecting.status & ORGAN_ARTERY_CUT))//There is nothing to fix don't fix anything.
			to_chat(user, "<span class='danger'>Why would I apply \the [src]? There's nothing to fix. </span>")
			return
		if(affecting.tourniqueted)
			to_chat(user, "<span class='danger'>[M]'s [limb] is already tourniqueted!</span>")
			return
		if (M != user)
			to_chat("<span class='danger'>[user] starts to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You start to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		else
			if(( !user.hand && (affecting.organ_tag in list(BP_R_ARM, BP_R_HAND)) || \
				user.hand && (affecting.organ_tag in list(BP_L_ARM, BP_L_HAND)) ))
				to_chat(user, "<span class='danger'>You can't apply \the [src] to the arm you're using!</span>")
				return
			to_chat("<span class='danger'>[user] starts to apply \the [src] to their [limb].</span>", "<span class='danger'>You start to apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		if(do_after(user, max(20, 50 - (SKILL_MEDICAL, 2)), M))
			if(M == user && !user.statscheck(SKILL_MEDICAL, 2))
				to_chat("<span class='danger'>\The [user] fumbles [src].</span>", "<span class='danger'>You fumble [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
				return
			var/obj/item/stack/medical/tourniquet/S = split(1)
			if(S)
				if(affecting.apply_tourniquet(S))
					S.forceMove(affecting)
					if (M != user)
						to_chat("<span class='danger'>\The [user] finishes applying [src] to [M]'s [limb].</span>", "<span class='danger'>You finish applying \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					else
						to_chat("<span class='danger'>\The [user] successfully applies [src] to their [limb].</span>", "<span class='danger'>You successfully apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					return
				S.dropInto(src.loc) //didn't get applied, so just drop it
			user.visible_message("<span class='danger'>\The [user] fails to apply [src].</span>", "<span class='danger'>You fail to apply [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		return
