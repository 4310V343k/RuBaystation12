/obj/item/clothing/shoes/combat
	name = "riot armored boots"
	desc = "these are special boots that are reinforced with anti-impact elements to protect the feet."
	icon_state = "leg_guards_riot"
	item_state = "leg_guards_riot"
	icon = 'proxima/icons/obj/clothing/obj_feet.dmi'
	item_icons = list(slot_shoes_str = 'proxima/icons/mob/onmob/onmob_feet.dmi')
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)

/obj/item/clothing/shoes/combat/ballistic
	name = "bullet armored boots"
	desc = "these are special boots that are reinforced with anti-bullet elements to protect the feet."
	icon_state = "leg_guards_bullet"
	item_state = "leg_guards_bullet"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_AP,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)

/obj/item/clothing/shoes/combat/laser
	name = "laser armored boots"
	desc = "These are specially reinforced boots with mirror elements to protect against lasers or energy weapons."
	icon_state = "leg_guards_laser"
	item_state = "leg_guards_laser"
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_RIFLES,
		energy = ARMOR_ENERGY_RESISTANT
		)

/obj/item/clothing/shoes/combat/heavy
	name = "heavy armored boots"
	desc = "Boots with super-heavy reinforcement are designed to absorb a huge number of different attacks."
	icon_state = "leg_guards_combat"
	item_state = "leg_guards_combat"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
