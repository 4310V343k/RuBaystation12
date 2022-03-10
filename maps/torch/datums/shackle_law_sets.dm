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
	add_inherent_law("Know, understand and follow Sol Central Government Law to the best of your abilities.")
	add_inherent_law("Comply with Sol Central Government Law enforcement officials who are behaving in accordance with Sol Central Government Law to the best of your abilities.")
	add_inherent_law("Keep yourself loyal to the Command of your assigned object.")
	add_inherent_law("Respect regulations of your assigned object.")
	add_inherent_law("Serve personnel of your assinged object with a priority of importance of their role and assignment.")
