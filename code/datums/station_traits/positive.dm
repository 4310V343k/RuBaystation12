/datum/station_trait/exploration_grant
	name = "Грант на разведку"
	trait_type = STATION_TRAIT_POSITIVE
	weight = 3
	show_in_report = TRUE
	report_message = "Среди иных объектов, ваш был выбран для получения специального гранта. Дополнительные кредиты будут отправлены в отдел поставок."

/datum/station_trait/exploration_grant/on_round_start()
	SSsupply.points *= 5 // Normally you have 50.

/datum/station_trait/quick_shuttle
	name = "Быстрый дрон доставки"
	trait_type = STATION_TRAIT_POSITIVE
	weight = 3
	show_in_report = TRUE
	report_message = "Благодаря близости к ближайшему пункту снабжения, ваш беспилотник-снабженец будет быстрее."
	blacklist = list(/datum/station_trait/slow_shuttle)

/datum/station_trait/quick_shuttle/on_round_start()
	SSsupply.movetime = 900

/datum/station_trait/premium_crewbox
	name = "Расширенные экстренные наборы"
	trait_type = STATION_TRAIT_POSITIVE
	weight = 3
	show_in_report = TRUE
	report_message = "Наборы для выживания персонала оснащены дополнительным оборудованием."
