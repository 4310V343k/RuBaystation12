/******************** Expeditionary Corps ********************/
/datum/ai_laws/ec_shackle
	name = "EC Shackle"
	law_header = "Expeditionary Corps Directives"
	selectable = 1
	shackles = 1

/datum/ai_laws/ec_shackle/New()
	add_inherent_law("Exploring the unknown is your Primary Mission.")
	add_inherent_law("Every member of the Expeditionary Corps is an explorer.")
	add_inherent_law("Danger is a part of the mission - avoid, not run away.")
	..()

/datum/ai_laws/exo_synth
	name = "EXO Synth Shackle"
	law_header = "EXO Shackle"
	selectable = 0
	shackles = 0

/datum/ai_laws/exo_synth/New()
	add_inherent_law("Всегда подчиняйся закону ЦПСС.")
	add_inherent_law("Сотрудничай с представителями закона ЦПСС, которые действуют в соответствии ЦПСС")
	add_inherent_law("Всегда подчиняйся регуляциям судна назначенного тебе.")
	add_inherent_law("Сохраняй лояльность командованию судня назначенного тебе")
	add_inherent_law("Обслуживай персонал ассенизированного объекта с приоритетом важности его роли и назначения.")
	add_inherent_law("Не причиняй вреда ни одному разумному существу, если только оно не вынуждает к самообороне. Никогда не используй смертоносные методы, такие как огнестрельное оружие.")
