/*
	"Brain expansion"
	Rare, short event that makes every item worth one more research point for a small while

	All relevant code is run in /datum/research/proc/UpdateTech
*/

/datum/event/brain_expansion
	startWhen	= 0
	endWhen		= 150

/datum/event/brain_expansion/announce()
	command_announcement.Announce("Аномальные показатели эффективности обнаружены в нейронных сетях деструктивного анализа. Ожидайте возвращения прежних параметров в ближайшее время", "Контроль Нейронной Сети [station_name()]", zlevels = affecting_z)

/datum/event/brain_expansion/end()
	command_announcement.Announce("Нейронная сеть деструктивного анализа вернулась в регламентное состояние.", "Контроль Нейронной Сети [station_name()]", zlevels = affecting_z)
