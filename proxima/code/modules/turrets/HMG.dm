
/obj/structure/turret/hmg
	name = "HMG Turret"
	desc = "A HMG Turret"

	icon_state = "hmgturret"

	turret_gun = /obj/item/gun/projectile/turret/hmg
	kit_undeploy = /obj/item/turret_deploy_kit/hmg

/obj/item/gun/projectile/turret/hmg //Slowfiring, so we're going to cap our dispersion much lower.
	name = "HMG Turret"
	desc = "Fires slower than the Confetti Maker, but with more stopping power per round."

	fire_sound = 'sound/weapons/gunshot/mech_autocannon.ogg'
	icon_state = "m247h_obj"
	item_state = "m247h_obj"
	caliber = CALIBER_ANTIMATERIAL_SMALL
	magazine_type = /obj/item/ammo_magazine/HMG_boxmag
	fire_delay = 5 //1 lower than normal

	//Chaingun dispersions on paced shots with worse dispersion on longburst. Higher damage, but faster firing on paced shots
	//Than chaingun provides.
	firemodes = list(\
	list(mode_name="paced shots",  burst=30,burst_delay = 1,fire_delay = 5, accuracy = 0, dispersion=list(0.1,0.1,0.1,0.2,0.2,0.3,0.3,0.4,0.4,0.4,0.4,0.45)),
	list(mode_name="long bursts",  burst=40,burst_delay = 2,fire_delay = 6, accuracy = -1,dispersion=list(0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5,0.55,0.55,0.6,0.6))
	)



/obj/item/gun/projectile/turret/hmg/detached
	item_icons = list(
		slot_l_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		slot_r_hand_str = 'proxima/code/modules/turrets/mob_turret.dmi',
		)

	fire_delay = 8
	accuracy = -1

	firemodes = list(\
	list(mode_name="paced shots",  burst=20,burst_delay = 3,fire_delay = 8, accuracy = -1, dispersion=list(0.1,0.1,0.1,0.2,0.2,0.3,0.3,0.4,0.4,0.4,0.4,0.45)),
	list(mode_name="long bursts",  burst=10,burst_delay = 2,fire_delay = 10, accuracy = -2,dispersion=list(0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5,0.55,0.55,0.6,0.6))
	)
