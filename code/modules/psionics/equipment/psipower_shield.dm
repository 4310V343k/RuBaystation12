/proc/check_shield_arc(mob/user, var/bad_arc, atom/damage_source = null, mob/attacker = null)
	//check attack direction
	var/attack_dir = 0 //direction from the user to the source of the attack
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		attack_dir = get_dir(get_turf(user), P.starting)
	else if(attacker)
		attack_dir = get_dir(get_turf(user), get_turf(attacker))
	else if(damage_source)
		attack_dir = get_dir(get_turf(user), get_turf(damage_source))

	if(!(attack_dir && (attack_dir & bad_arc)))
		return 1
	return 0

/proc/default_parry_check(mob/user, mob/attacker, atom/damage_source)
	//parry only melee attacks
	if(istype(damage_source, /obj/item/projectile) || (attacker && get_dist(user, attacker) > 1) || user.incapacitated())
		return 0

	//block as long as they are not directly behind us
	var/bad_arc = reverse_direction(user.dir) //arc of directions from which we cannot block
	if(!check_shield_arc(user, bad_arc, damage_source, attacker))
		return 0

	return 1

/obj/item/psychic_power/psishield
	name = "psychokinetic shield"
	force = 5.0
	can_block_lasers = TRUE
	var/base_block_chance = 60
	var/max_block = 0

/obj/item/psychic_power/psishield/handle_shield(mob/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/weapons/Genhit.ogg', 50, 1)

/obj/item/psychic_power/psishield/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		//plastic shields do not stop bullets or lasers, even in space. Will block beanbags, rubber bullets, and stunshots just fine though.
		if(is_sharp(P) && damage >= max_block)
			return 0
		if(istype(P, /obj/item/projectile/beam) && (!can_block_lasers || (P.armor_penetration >= max_block)))
			return 0
	return base_block_chance

/obj/item/psychic_power/psishield/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/psychic_power/psiblade))
		if(cooldown < world.time - 25)
			user.visible_message("<span class='warning'>[user] bashes [src] with [W]!</span>")
			playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
			cooldown = world.time
	else
		..()

/obj/item/psychic_power/psishield/master
	max_block = 30
	base_block_chance = 45
	maintain_cost = 3

/obj/item/psychic_power/psishield/master/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		if((is_sharp(P) && damage > 10) || istype(P, /obj/item/projectile/beam))
			return (base_block_chance - round(damage / 2.5)) //block bullets and beams using the old block chance
	return base_block_chance

/obj/item/psychic_power/psishield/master/grand
	max_block = 40
	base_block_chance = 55
	maintain_cost = 3

/obj/item/psychic_power/psishield/master/grand/paramount
	max_block = 60
	base_block_chance = 80
	maintain_cost = 4