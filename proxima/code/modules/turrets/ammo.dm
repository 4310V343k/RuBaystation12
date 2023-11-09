
//HMG AMMO DEFINES//
/obj/item/ammo_magazine/HMG_boxmag
	name = "HMG box magazine (12.7mm) HEHVAP"
	desc = "High Explosive, High Velocity, Armour Piercing. This has it all."

	icon = 'proxima/code/modules/turrets/turret_items.dmi'
	icon_state = "hmgturretbox"

	ammo_type = /obj/item/ammo_casing/amr
	caliber = CALIBER_ANTIMATERIAL_SMALL
	mag_type = MAGAZINE


	max_ammo = 150
	multiple_sprites = 1


//CHAINGUN AMMO DEFINES//
/obj/item/ammo_magazine/chaingun_boxmag
	name = "Chaingun box magazine (7.62mm) AP"
	desc = "A large box filled with 7.62mm AP ammo."

	icon = 'proxima/code/modules/turrets/turret_items.dmi'
	icon_state = "chaingunturretbox"

	ammo_type = /obj/item/projectile/bullet/rifle/military
	caliber = CALIBER_RIFLE_MILITARY
	mag_type = MAGAZINE


	max_ammo = 250
	multiple_sprites = 1
