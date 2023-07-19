/datum/station_trait/slow_shuttle
	name = "Медленный дрон доставки"
	trait_type = STATION_TRAIT_NEGATIVE
	weight = 2
	show_in_report = TRUE
	report_message = "Из-за расстояния до нашей станции снабжения, время полета беспилотника-снабженеца до вашего грузового отделения будет увеличено."
	blacklist = list(/datum/station_trait/quick_shuttle)

/datum/station_trait/slow_shuttle/on_round_start()
	SSsupply.movetime = 1500

/datum/station_trait/disabled_lighting
	name = "Overloaded Lighting"
	trait_type = STATION_TRAIT_NEGATIVE
	weight = 3
	show_in_report = TRUE
	report_message = "Объект был подвергнут небольшому электрическому шторму, и поэтому некоторые лампочки, возможно, нуждаются в замене."

/datum/station_trait/disabled_lighting/on_round_start()
	for(var/obj/machinery/power/apc/C in SSmachines.machinery)
		if(!C.is_critical && (C.z in GLOB.using_map.station_levels))
			C.overload_lighting(25) // Every fourth light
