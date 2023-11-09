
#define EXPLOSION_DISMOUNT_FLING_DIST 3

/obj/structure/turret
	name = "Turret"
	desc = "A turret"

	icon = 'proxima/code/modules/turrets/turrets_unsc.dmi'
	icon_state = "bipod"
	layer = ABOVE_HUMAN_LAYER
	anchored = 1
	density = 0
	buckle_movable = 1

	pixel_x = -6
	pixel_y = -6

	var/mob/living/carbon/human/mob_manning //The mob manning the gun.
	var/obj/kit_undeploy = null
	var/list/manning_pixel_offsets = list(25,25) //Format is offset (EW,NS)
	var/obj/item/gun/projectile/turret_gun = /obj/item/gun/projectile/turret //The "gun" the turret uses to fire.
	var/obj/stand = /obj/structure/bipod //The object reference to the object to replace with when the gun is removed.
	var/remove_time = 5 //The time it takes to rip the gun off the stand, in seconds. Quarter this is pack-up time.
	var/turf/turret_turf
	var/bullet_deflect_chance = 75
	var/bullet_deflect_chance_max = 75 //The chance the gun has to reflect projectiles, from the sides
	var/bullet_deflect_chance_min = 30
	var/armor_pen_divisor = 2 //Used when calculating how much armor pen is converted into extra damage to the deflect chance.
	var/bullet_deflect_chance_reset_time = 4 SECONDS //How long it takes until the game fully resets the deflect chance.
	var/bullet_deflect_reset_at = 0

/obj/structure/turret/New()
	. = ..()
	src.turret_turf = get_turf(/obj/structure/turret)
	if(kit_undeploy)
		verbs += /obj/structure/turret/proc/pack_up_turret

/obj/structure/turret/proc/pack_up_turret()
	set name = "Pack Up Turret"
	set category = "Object"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user) || user.incapacitated())
		to_chat(usr,"<span class = 'notice'>You cannot do that!</span>")
		return
	visible_message("<span class = 'warning'>[user] starts packing up [src]...</span>")
	if(!do_after(user,remove_time/4 SECONDS,src))
		return
	visible_message("<span class = 'notice'>[user] packs up [src], readying it for movement.</span>")
	new kit_undeploy (loc)
	unman_turret()
	qdel(src)

/obj/structure/turret/proc/check_reset_deflect()
	if(bullet_deflect_reset_at != 0 && world.time >= bullet_deflect_reset_at)
		bullet_deflect_chance = bullet_deflect_chance_max

/obj/structure/turret/bullet_act(obj/item/projectile/P, def_zone)
	check_reset_deflect()
	var/prob_use = bullet_deflect_chance - P.armor_penetration
	if(!prob(prob_use))
		if(mob_manning)
			mob_manning.bullet_act(P,def_zone)
			return
	else
		var/dam_to_deflect = P.damage/10
		if(P.armor_penetration)
			dam_to_deflect += P.armor_penetration / armor_pen_divisor
		if(dam_to_deflect)
			bullet_deflect_chance = max(bullet_deflect_chance - dam_to_deflect,bullet_deflect_chance_min)
			bullet_deflect_reset_at = world.time + bullet_deflect_chance_reset_time
		if(P.damtype == DAMAGE_BRUTE)
			visible_message("<span class = 'danger'>The [P.name] pings off the [name]</span>","<span class = 'notice'>You hear something ricochet</span>")
		else if(P.damtype == DAMAGE_BURN)
			visible_message("<span class = 'danger'>The [P.name] harmlessly splashes against the armour of the [name]</span>","<span class = 'notice'>You hear something violently boiling</span>")
		else
			visible_message("<span class = 'danger'>The [P.name] ineffectively skims the armour of the [name]</span>","<span class = 'notice'>You hear something ricochet</span>")


/obj/structure/turret/proc/check_attack_valid(mob/user)
	if(!istype(user,/mob/living/carbon/human))
		to_chat(user,"<span class = 'notice'>You can't understand how to use the [name]</span>")
		return 0
	if(mob_manning)
		to_chat(user,"<span class = 'notice'>Someone's already using the [name]</span>")
		return 0
	if(user.incapacitated())
		return 0
	return 1

/obj/structure/turret/proc/handle_dir()
	if(!mob_manning)
		return
	mob_manning.pixel_y = initial(mob_manning.pixel_y)
	mob_manning.pixel_x = initial(mob_manning.pixel_x)
	switch(mob_manning.dir)
		if(1)
			mob_manning.pixel_y = -manning_pixel_offsets[2]
			dir = NORTH
		if(2)
			mob_manning.pixel_y = manning_pixel_offsets[2]
			dir = SOUTH
		if(4)
			mob_manning.pixel_x = -manning_pixel_offsets[1]
			dir = EAST
		if(8)
			mob_manning.pixel_x = manning_pixel_offsets[1]
			dir = WEST

/obj/structure/turret/proc/give_manning_gun()
	var/obj/gun = new turret_gun
	if(!mob_manning.put_in_active_hand(gun))
		if(!mob_manning.put_in_inactive_hand(gun))
			unman_turret()
			return 0
	return 1

/obj/structure/turret/proc/remove_manning_gun()
	if(mob_manning.l_hand && (mob_manning.l_hand.type == turret_gun))
		mob_manning.drop_from_inventory(mob_manning.l_hand)
		qdel(mob_manning.l_hand)
	if(mob_manning.r_hand && (mob_manning.r_hand.type == turret_gun))
		mob_manning.drop_from_inventory(mob_manning.r_hand)
		qdel(mob_manning.r_hand)


/obj/structure/turret/proc/man_turret(mob/living/carbon/human/user)
	mob_manning = user
	mob_manning.forceMove(loc)
	mob_manning.buckled = src
	give_manning_gun()
	handle_dir()


/obj/structure/turret/proc/unman_turret()
	if(mob_manning)
		mob_manning.buckled = null
		mob_manning.pixel_x = initial(mob_manning.pixel_x)
		mob_manning.pixel_y = initial(mob_manning.pixel_y)
		remove_manning_gun()
		mob_manning = null

/obj/structure/turret/attack_hand(mob/user)
	if(!mob_manning)
		man_turret(user)
	else
		unman_turret(user)

/obj/structure/turret/ex_act(severity)
	if(mob_manning && severity <= 2)
		var/mob/mm = mob_manning
		unman_turret()
		to_chat(mm,"<span class = 'danger'>The blast pushes you off \the [src], you'll have to grab it again to fire!</span>")
		var/move_in = get_dir(get_step(src,dir),src)
		for(var/i = 0 to EXPLOSION_DISMOUNT_FLING_DIST)
			if(!mob_manning.Move(get_step(mob_manning,move_in)))
				break

/obj/structure/turret/attackby(obj/item/W, user)
	if(W.type == turret_gun)
		var/obj/item/gun/projectile/gun = W
		if(gun.ammo_magazine)
			gun.ammo_magazine.stored_ammo.Cut()
			gun.unload_ammo(user, 1)
		gun.load_ammo(new gun.magazine_type, user)

/obj/structure/turret/proc/check_user_has_gun()
	var/unman = 0
	if(isnull(mob_manning))
		unman = 1
	else if(!mob_manning.l_hand && !mob_manning.r_hand)
		unman = 1
	else if(mob_manning.l_hand && (mob_manning.l_hand.type != turret_gun) && (mob_manning.r_hand && (mob_manning.r_hand.type != turret_gun)))
		unman = 1
	else if(mob_manning.incapacitated())
		unman = 1
	else if(!mob_manning.Adjacent(src))
		unman = 1

	if(unman)
		unman_turret()


/obj/structure/turret/Destroy()
	unman_turret()
	. = ..()

//Bipod Define//
/obj/structure/bipod
	name = "Bipod"
	desc = "The swivel that used to hold a weapon has been rendered non-functional."

	icon = 'proxima/code/modules/turrets/turrets_unsc.dmi'
	icon_state = "bipod"

	pixel_x = -6
	pixel_y = -6


//Inbuilt Gun Define//
/obj/item/gun/projectile/turret
	name = "Mounted Turret Gun"
	desc = "A turret's gun."

	icon = 'proxima/code/modules/turrets/turret_items.dmi'
	icon_state = "chaingun_obj"
	item_state = "chaingun_obj"
	one_hand_penalty = -1

	w_class = ITEM_SIZE_HUGE
	item_icons = list( //Null here due to this version being used only when manning the turret, Every turret requires a /detached define with the item_icons set.
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)

	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	slot_flags = 0
	can_special_reload = TRUE
	auto_eject = 1
	caliber = CALIBER_RIFLE_MILITARY
	magazine_type = /obj/item/ammo_magazine/chaingun_boxmag


	fire_delay = 15
	burst = 10
	burst_delay = 1
	burst_accuracy = list(0,0,0,0,0,0,-1)
	dispersion = list(0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.2,1.4)

	slowdown_general = 0.8

	var/load_time = 1 //The time it takes to load the weapon, in seconds.
	var/removed_from_turret = 0 //If the gun has been removed from the turret base.

/obj/item/gun/projectile/turret/load_ammo(obj/item/A, mob/user)
	visible_message("<span class = 'danger'>[user.name] loads the [name]</span>",)
	..(A,user)

/obj/item/gun/projectile/turret/dropped()
	. = ..()
	if(!removed_from_turret)
		qdel(src)

/obj/item/gun/projectile/turret/update_icon()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]_unloaded"


//Detached Turret Gun Define// Every detachable turret gun needs this.
/obj/item/gun/projectile/turret/detached
	item_icons = list(
		slot_l_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		slot_r_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		)
