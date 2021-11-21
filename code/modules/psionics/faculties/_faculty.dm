/decl/psionic_faculty
	var/id
	var/name
	var/associated_intent
	var/list/armour_types = list()
	var/list/powers = list()
	// by RuBay Hacso
	var/supress_parent_proc = FALSE

/decl/psionic_faculty/New()
	..()
	for(var/atype in armour_types)
		SSpsi.armour_faculty_by_type[atype] = id
