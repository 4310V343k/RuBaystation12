
/obj/structure/turret/chaingun
	name = "Confetti Maker Chaingun Turret"
	desc = "A chaingun turret nicknamed the Confetti Maker due to it's inaccuracy and extraordinary rate of fire."

	icon_state = "chaingunturret"
	turret_gun = /obj/item/gun/projectile/turret/chaingun
	kit_undeploy = /obj/item/turret_deploy_kit/chaingun

/obj/item/gun/projectile/turret/chaingun
	name = "Confetti Maker Chaingun Turret"
	desc = "A lead-spewing gun, usually found mounted to a turret. It is known for it's inaccuracy and extraordinary rate of fire.."

	fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
	icon_state = "chaingun_obj"
	item_state = "chaingun_obj"

	caliber = CALIBER_RIFLE_MILITARY
	magazine_type = /obj/item/ammo_magazine/chaingun_boxmag
	fire_delay = 5 //1 lower than normal
	accuracy = -1
	dispersion = list(0.2,0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5,0.5,0.5,0.55)


	firemodes = list(\
	list(mode_name="long bursts",  burst=50,burst_delay = 1,fire_delay = 5, accuracy = -1,dispersion=list(0.2,0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5,0.5,0.5,0.55)),
	list(mode_name="paced shots",  burst=25,burst_delay = 4,fire_delay = 7, accuracy = 0,dispersion=list(0.1,0.1,0.1,0.2,0.2,0.3,0.3,0.4,0.4,0.4,0.4,0.45))
	)

/obj/item/gun/projectile/turret/chaingun/detached
	item_icons = list(
		slot_l_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		slot_r_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		)

	fire_delay = 8
	accuracy = -2
	//Accuracy drops by -1 on both modes.
	firemodes = list(\
	list(mode_name="long bursts",  burst=30,burst_delay = 1,fire_delay = 8, accuracy = -2,dispersion=list(0.2,0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5,0.5,0.5,0.55)),
	list(mode_name="paced shots",  burst=12,burst_delay = 4,fire_delay = 10, accuracy = -1,dispersion=list(0.0,0.0,0.1,0.1,0.1,0.2,0.2,0.3,0.3,0.3,0.3,0.35))
	)
