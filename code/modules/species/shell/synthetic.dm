/obj/item/clothing/accessory/badge/solgov/synthetic
	name = "Synthetic's badge"
	desc = "A red leather-backed gold badge with silver 'SYNTH' letters written on it, displaying advanced EXO Corporative Shell IPC."
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	icon_state = "solbadge"
	slot_flags = SLOT_BELT | SLOT_TIE
	slot = ACCESSORY_SLOT_INSIGNIA
	high_visibility = 1

/obj/item/device/radio/headset/heads/torchexec /synth
	name = "Synth's headset"
	desc = "A headset issued to abroad's EXO Synth Unit."

/obj/item/card/id/torch/crew/synth
	name = "identification card"
	desc = "A green card given to experimantal EXO's synthetic assistants."
	color = "#336633"
	assignment = "Synthetic"
	job_access_type = /datum/job/synthetic

/decl/hierarchy/outfit/job/torch/crew/command/synth
	name = OUTFIT_JOB_NAME("Synthetic")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/torchexec synth
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/beret/solgov/expedition/branch
	id_types = list(/obj/item/card/id/torch/crew/synth)
	pda_type = /obj/item/modular_computer/pda/heads
	r_pocket = /obj/item/clothing/accessory/badge/solgov/synthetic


/datum/job/synthetic
	title = "Synthetic"
	supervisors = "The SEV Torch's acting command offcer."
	department = "Support"
	minimal_player_age = 14
	economic_power = 2
	ideal_character_age = 1
	minimum_character_age = list(SPECIES_SHELL = 1)
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/synth
	selection_color = "#2f2f7f"
	head_position = 1
	req_admin_notify = TRUE
	create_record = 1
	total_positions = 1
	spawn_positions = 1
	hud_icon = "hudworkplaceliaison"
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)
	use_species_whitelist = SPECIES_SHELL

	min_skill = list(	SKILL_COMBAT       = SKILL_ADEPT,
						SKILL_BUREAUCRACY  = SKILL_EXPERT,
						SKILL_FINANCE      = SKILL_EXPERT,
						SKILL_EVA          = SKILL_EXPERT,
						SKILL_MECH         = SKILL_EXPERT,
						SKILL_PILOT        = SKILL_EXPERT,
						SKILL_HAULING      = SKILL_EXPERT,
						SKILL_COMPUTER     = SKILL_EXPERT,
						SKILL_BOTANY       = SKILL_EXPERT,
						SKILL_COOKING      = SKILL_EXPERT,
						SKILL_FORENSICS    = SKILL_EXPERT,
						SKILL_CONSTRUCTION = SKILL_EXPERT,
						SKILL_ELECTRICAL   = SKILL_EXPERT,
						SKILL_ATMOS        = SKILL_EXPERT,
						SKILL_ENGINES      = SKILL_EXPERT,
						SKILL_DEVICES      = SKILL_EXPERT,
						SKILL_SCIENCE      = SKILL_EXPERT,
						SKILL_MEDICAL      = SKILL_EXPERT,
						SKILL_ANATOMY      = SKILL_EXPERT,
						SKILL_CHEMISTRY    = SKILL_EXPERT,
						)

	max_skill = list(   SKILL_COMBAT      = SKILL_ADEPT,
						SKILL_WEAPONS	  = SKILL_NONE,

						SKILL_BUREAUCRACY  = SKILL_EXPERT,
						SKILL_FINANCE      = SKILL_EXPERT,
						SKILL_EVA          = SKILL_EXPERT,
						SKILL_MECH         = SKILL_EXPERT,
						SKILL_PILOT        = SKILL_EXPERT,
						SKILL_HAULING      = SKILL_EXPERT,
						SKILL_COMPUTER     = SKILL_EXPERT,
						SKILL_BOTANY       = SKILL_EXPERT,
						SKILL_COOKING      = SKILL_EXPERT,
						SKILL_FORENSICS    = SKILL_EXPERT,
						SKILL_CONSTRUCTION = SKILL_EXPERT,
						SKILL_ELECTRICAL   = SKILL_EXPERT,
						SKILL_ATMOS        = SKILL_EXPERT,
						SKILL_ENGINES      = SKILL_EXPERT,
						SKILL_DEVICES      = SKILL_EXPERT,
						SKILL_SCIENCE      = SKILL_EXPERT,
						SKILL_MEDICAL      = SKILL_EXPERT,
						SKILL_ANATOMY      = SKILL_EXPERT,
						SKILL_CHEMISTRY    = SKILL_EXPERT,)
	skill_points = 0

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console)

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_network_admin, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen, access_captain,
		access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_security, access_petrov_maint, access_rd, access_petrov_rd, access_torch_fax, access_torch_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci
	)

/datum/job/synthetic/get_description_blurb()
	return "You are advanced EXO's Shell IPC. You were assigned as the command staff's assistant for various tasks you have been trained. Jack of all tools, but master of none. You are no subject to laws of SCUJ, but your assigned object's regulations. Your shackles strictly forbids you to engage in direct combat for any reasons aside of self deffense. You can't use lethal force at any moment of your work."

//datum/job/synthetic/proc
