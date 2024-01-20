/obj/item/clothing/gloves/combat
	name = "riot armored gloves"
	desc = "it's DOOMING TIME."
	icon_state = "arm_guards_riot"
	item_state = "arm_guards_riot"
	icon = 'proxima/icons/obj/clothing/obj_hands.dmi'
	item_icons = list(slot_gloves_str = 'proxima/icons/mob/onmob/onmob_hands.dmi')
	force = 10
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)


/obj/item/clothing/gloves/combat/ballistic
	name = "bullet armored gloves"
	desc = "it's DOOMING TIME."
	icon_state = "arm_guards_bullet"
	item_state = "arm_guards_bullet"
	force = 10
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)

/obj/item/clothing/gloves/combat/laser
	name = "laser armored gloves"
	desc = "it's DOOMING TIME."
	icon_state = "arm_guards_laser"
	item_state = "arm_guards_laser"
	force = 10
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_RIFLES,
		energy = ARMOR_ENERGY_RESISTANT
		)

/obj/item/clothing/gloves/combat/heavy
	name = "heavy armored gloves"
	desc = "it's DOOMING TIME."
	icon_state = "arm_guards_combat"
	item_state = "arm_guards_combat"
	force = 10
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
