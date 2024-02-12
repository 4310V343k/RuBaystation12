/datum/job/captain
	title = "Commanding Officer"
	department = "Командный"
	supervisors = "Центральному Правительству Солнечной Системы и ВЮКЦПСС"
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 40)
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/CO
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o6
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Вы - Командующий офицер (КО). Вы - первый человек на борту судна. \
	Вы опытный профессиональный офицер, контролирующий всё судно и в конечном счете несущий ответственность за все, что происходит на борту. \
	Ваша работа - убедится, что ГЭК \"Факел\" выполняет свою миссию по исследованию космоса. \
	Делегируете Ваши полномочия Исполнительному офицеру, главам департаментов и Вашему Старшему советнику по работе с личным составом для эффективного управления судном, прислушивайтесь к их опыту и доверяйте им."

/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=22)
	captain_announcement.Announce("Всей команде, [alt_title || title] [person.real_name] на палубе!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "Executive Officer"
	supervisors = "Командующему офицеру"
	department = "Командный"
	department_flag = COM
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/XO
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/XO/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o5,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_network_admin, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_research_security, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen,
		access_emergency_armory, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_control, access_petrov_maint, access_rd, access_petrov_rd, access_torch_fax, access_torch_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci, access_research_storage
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "Вы - Исполнительный Офицер (ИО). Вы опытный офицер и второй человек на корабле после Командующего Офицера. Вы несёте ответственность за стабильную работу корабля под началом Командующего офицера. \
	В отсутствие КО, ожидается, что Вы займёте его место. \
	Ваша основная задача - управлять главами отделов и всеми теми, кто не входит в них. \
	Вы также ответственны за контрактников и пассажиров на борту. Старший советник по работе в личным составом и Мостовые Офицеры являются инструментами в Вашем распоряжении."

/datum/job/rd
	title = "Chief Science Officer"
	supervisors = "Командующему и Исполнительному офицеру"
	economic_power = 12
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/research/cso
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/ec/o5
	) //PRX

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_ADEPT,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
		access_research, access_mining, access_mining_office, access_mining_station,access_ai_upload, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_research_security, access_research_storage
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/rd/get_description_blurb()
	return "Вы - Главный Научный Офицер (ГНО). Вы ответственны за работу научно-исследовательского отдела. \
	Вы занимаетесь научными аспектами миссии и отвечаете за корпоративные интересы Организации Экспедиционного Корпуса. \
	Убедитесь, что научный персонал выполняет свою работу, работайте сами и отправляйте группы на исследовательские \
	экспедиции для нахождения артефактов, полезных для миссии. Консультируйте КО по научным вопросам."

/datum/job/cmo
	title = "Chief Medical Officer"
	supervisors = "Командующему и Исполнительному офицеру"
	economic_power = 14
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 48
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/cmo
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/cmo/fleet,
		/datum/mil_branch/iic = /decl/hierarchy/outfit/job/torch/crew/command/cmo/army
	) //PRX
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/iic/o3
	) //PRX
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_ADEPT)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 26

	access = list(
		access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads,
		access_chapel_office, access_crematorium, access_chemistry, access_virology, access_aquila,
		access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
		access_medical_equip, access_solgov_crew, access_senmed, access_hangar, access_torch_fax, access_radio_comm,
		access_radio_med
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "Вы - Главный Медицинский Офицер (ГМО). Вы отвечаете за работу медицинского отдела. Вы гарантируете, что все сотрудники отдела хорошо обученны, подготовленны и что они выполняют свои обязанности. \
	Убедитесь, что Ваши врачи укомплектовали Ваш лазарет, а Ваши санитары/парамедики готовы отреагировать на вызов. \
	Действуйте в качестве второго хирурга или резервного химика в отсутствие того или другого. Ожидается, что Вы очень хорошо знаете медицину, химию и основные регуляции."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "Командующему и Исполнительному офицеру"
	economic_power = 12
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 40
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/chief_engineer
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/chief_engineer/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4
	) //PRX
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
		access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
		access_network, access_network_admin, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_solgov_crew, access_aquila, access_seneng, access_hangar, access_torch_fax, access_torch_helm, access_radio_comm,
		access_radio_eng
		)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)

/datum/job/chief_engineer/get_description_blurb()
	return "Вы - Главный Инженер (ГИ). Вы ответственны за работу инженерного отдела. \
	Вы несёте ответственность за старшего инженера, который является Вашей правой рукой и (должен) быть компитентным и опытным инженером. \
	Делегируйте задачи ему и слушайте его. Управляйте инженерами, убедитесь, что на корабле поступает энергия и, что все пробоины и поломки устранены. \
	Консультируйте КО по инженерным вопросам. Вы также ответственны за обслуживания и контроль всех синтетиков корабля. \
	Вы - опытный инженер с большим багажом теоритических и практически знаний. Вам также следует знать регуляции корабля на приемлемом уровне."

/datum/job/hos
	title = "Chief of Security"
	supervisors = "Командующему и Исполнительному офицеру"
	economic_power = 10
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/cos
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/cos/fleet,
		/datum/mil_branch/iic = /decl/hierarchy/outfit/job/torch/crew/command/cos/army
	) //PRX
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/iic/o2,
		/datum/mil_rank/iic/o3,
		/datum/mil_rank/iic/o4
	) //PRX
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers,
		access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads, access_aquila,
		access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_solgov_crew, access_gun, access_emergency_armory, access_hangar, access_torch_fax,
		access_radio_comm, access_radio_sec
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "Вы - Глава Службы Безопасности. Вы отвечаете за охрану корабле, равно как и за каптенармусов, смотрителя и криминалистов. \
	Вы поддерживаете порядок на корабле, а также отвечаете за внешнюю и внутренную безопасность. Вы - закон. Вы подчиняетесь КО и ИО. \
	От Вас ожидается знание Военно-Юридического кодекса ЦПСС, Законов ЦПСС, кодов угроз и основных регуляций на самом высоком уровне."

/datum/job/qm //PRX - ALL
	title = "Supply Corps Officer"
	selection_color = "#974e05"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	req_admin_notify = 1
	department_flag = SUP|COM
	supervisors = "Командующему и Исполнительному офицеру"
	economic_power = 12
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 40
	minimal_player_age = 14
	hud_icon = "hudsupplyofficer"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/supply/deckofficer
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/supply/deckofficer/fleet,
		/datum/mil_branch/iic = /decl/hierarchy/outfit/job/torch/crew/supply/deckofficer/army
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/iic/o2,
		/datum/mil_rank/iic/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC,
						SKILL_MECH        =	SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 18

	access = list(
		access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage, access_janitor,
		access_hydroponics, access_radio_serv, access_cargo, access_guppy_helm, access_kitchen, access_library, access_commissary,
		access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_mining, access_mining_office, access_mining_station, access_commissary, access_teleporter, access_eva, access_torch_fax,
		access_radio_sup, access_radio_exp, access_radio_comm, access_keycard_auth, access_heads, access_aquila, access_RC_announce
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/qm/get_description_blurb()
	return "Вы - Офицер Обеспечения (ОБ). Вы отвечаете за работу отделов снабжения и поставок. \
	С одной стороны, Вы следите за правильным оформлением бланков заказов и за тем, чтобы палубные техники \
	своевременно принимали и отправляли заказы, старатели добывали руду, а челноки находились в готовом к вылету состоянии. \
	С другой стороны, Вы отвечаете за целостность и учет всех складов на борту ГЭК 'Факел' и за тем, чем и как питаются, \
	что пьют борту. Иными словами, ОБ является главным по тому, что прибывает на склад корабля извне и \
	куда это вдальнейшем перераспределяется."

/datum/job/jua //PRX - ALL
	title = "Judge Advocate"
	department = "Поддержка командования"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "Командующему и Исполнительному офицеру"
	selection_color = "#2f2f7f"
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 40
	minimal_player_age = 14
	hud_icon = "hudjudgeadvocate"
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/jua
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/jua/fleet,
		/datum/mil_branch/iic = /decl/hierarchy/outfit/job/torch/crew/command/jua/army
		)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/iic/o2,
		/datum/mil_rank/iic/o3,
		)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_EXPERT,
	                    SKILL_FINANCE     = SKILL_BASIC)
	skill_points = 23
	minimum_character_age = list(SPECIES_HUMAN = 22)

	access = list(
		access_representative, access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	alt_titles = list("Military Lawyer")
	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/representative/get_description_blurb()
	return "Вы - Военный Прокурор. Консультруйте персонал по вопросам закона, регуляций и процедур. \
	Рассматривайте апелляции гражданских и военнослужащих. \
	Проводите суды. Отчитывайтесь о своих результатах Командующему и Исполнительному офицеру"

/datum/job/sea
	title = "Senior Enlisted Advisor"
	department = "Поддержка командования"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	supervisors = "Командующему и Исполнительному офицеру"
	selection_color = "#2f2f7f"
	minimal_player_age = 14
	economic_power = 11
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/sea/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/iic = /decl/hierarchy/outfit/job/torch/crew/command/sea/army
	) //PRX
	allowed_ranks = list(
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/iic/e8,
		/datum/mil_rank/iic/e8_alt,
		/datum/mil_rank/iic/e9,
		/datum/mil_rank/iic/e9_alt1
	) //PRX
	min_skill = list(   SKILL_EVA        = SKILL_BASIC,
	                    SKILL_COMBAT     = SKILL_BASIC,
	                    SKILL_WEAPONS    = SKILL_BASIC)

	max_skill = list(	SKILL_PILOT        = SKILL_ADEPT,
	                    SKILL_COMBAT       = SKILL_EXPERT,
	                    SKILL_WEAPONS      = SKILL_EXPERT,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 28

	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks, access_senadv,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
		)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/sea/get_description_blurb()
	return "Вы - Старший рядовой советник (СРС). Вы самый старший представитель рядового состава на корабле. \
	Вы консультируете старший офицерский состав по вопросам, связанными с рядовым составом, даёте оценки и советы остальным офицерам. \
	Вы отвечате за поддержание дисциплины и хорошего поведения среди рядовых, как и уведомляете офицеров о любых проблемах и \"консультируете\" их по ошибкам которые сделал рядовой состав. \
	Вы также выполняете различные поручения от имени КО и ИО. \
	Вы опытный член рядового состава и, скорее всего, равны по опыту только КО и ИО. Вы знаете регуляции лучше, чем кто-либо другой."

/datum/job/bridgeofficer
	title = "Bridge Officer"
	department = "Поддержка командования"
	department_flag = SPT
	total_positions = 3
	spawn_positions = 3
	supervisors = "Командующему и Исполнительному офицеру и остальным линейным офицерам"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/bridgeofficer
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/bridgeofficer/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT,
						SKILL_FORENSICS   = SKILL_BASIC
						)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
						SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 20

	alt_titles = list("Adjutant","Helmsman","Coordination Officer","Command Secretary") //PRX

	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgeofficer/get_description_blurb()
	return "Вы - Мостовой Офицер (МО). Вы очень молодой офицер и не даёте приказов сами. Вы подчинятесь всему командованию. \
	Вы разбераетесь с делами на мостике и отчитываетесь напрямую КО и ИО. Вы берете управление над Факелом и Аквиллой при необходимости. \
	Следите за программами, установленных на консолях мостика, и докладывайте актуальную информацию командованию."
