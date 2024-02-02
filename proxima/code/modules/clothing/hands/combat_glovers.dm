/obj/item/clothing/gloves/combat
	name = "riot armored gloves"
	desc = "These are special gloves with shockproof reinforcements. Specifically to restrain a madman with knives."
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
	desc = "These are special gloves with anti-bullet elements. Especially to restrain a pistol burst or a shot from a weak rifle."
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
	desc = "Gloves with protection from laser and energy weapons. Specifically to deter a psycho who connected a weapon to a nuclear reactor."
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
	desc = "Super-heavy reinforced gloves for special forces. They'll probably be able to withstand even a good rifle hit.."
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
