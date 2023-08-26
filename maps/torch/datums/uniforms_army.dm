/decl/hierarchy/mil_uniform/army/com //Can only be officers
	name = "Interstellar command"
	departments = COM

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/command
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/command,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/eng
	name = "Interstellar engineering"
	departments = ENG

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/engineering,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/engineering,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/engineering,
						/obj/item/clothing/gloves/thick)
	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/engineering


/decl/hierarchy/mil_uniform/army/eng/sword
	name = "Interstellar NCO sword engineering"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/eng/officer
	name = "Interstellar engineering CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/engineering,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/engineering/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/engineering/command,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/eng/officer/com //Can only be officers
	name = "Interstellar engineering command"
	departments = ENG|COM

/decl/hierarchy/mil_uniform/army/sec
	name = "Interstellar security"
	departments = SEC

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/security
	utility_extra = list(/obj/item/clothing/under/solgov/utility/army/security,
						/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/suit/storage/solgov/utility/army/security,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/security,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

/decl/hierarchy/mil_uniform/army/sec/sword
	name = "Interstellar NCO sword security"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/sec/officer
	name = "Interstellar security CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/security,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/security/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/security/command,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/sec/officer/com //Can only be officers
	name = "Interstellar security command"
	departments = SEC|COM

/decl/hierarchy/mil_uniform/army/med
	name = "Interstellar medical"
	departments = MED

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/medical
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/medical,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/medical,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/medical,
						/obj/item/clothing/gloves/thick)

/decl/hierarchy/mil_uniform/army/med/sword
	name = "Interstellar NCO sword medical"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/med/officer
	name = "Interstellar medical CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/medical,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/medical/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/medical/command,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/med/officer/com //Can only be officers
	name = "Interstellar medical command"
	departments = MED|COM

/decl/hierarchy/mil_uniform/army/sup
	name = "Interstellar supply"
	departments = SUP

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/supply
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/supply,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/supply,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/supply,
						/obj/item/clothing/gloves/thick)

/decl/hierarchy/mil_uniform/army/sup/sword
	name = "Interstellar NCO sword supply"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/sup/officer
	name = "Interstellar supply CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/supply,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/service/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/service/command,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)


/decl/hierarchy/mil_uniform/army/sup/officer/com
	name = "Interstellar Supply command"
	departments = SUP|COM
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/supply,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/suit/storage/solgov/utility/army/service/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/service/command,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/srv
	name = "Interstellar service"
	departments = SRV

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/service
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/service,
						/obj/item/clothing/suit/storage/solgov/utility/army/service,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/service,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

/decl/hierarchy/mil_uniform/army/srv/sword
	name = "Interstellar NCO sword service"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/srv/officer
	name = "Interstellar service CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/service,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)


	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/exp
	name = "Interstellar exploration"
	departments = EXP

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/exploration
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/exploration,
						/obj/item/clothing/suit/storage/solgov/utility/army/exploration,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/exploration,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)


/decl/hierarchy/mil_uniform/army/exp/sword
	name = "Interstellar NCO sword exploration"
	min_rank = 4

	dress_extra = list(/obj/item/material/sword/replica/officersword/army)

/decl/hierarchy/mil_uniform/army/exp/officer
	name = "Interstellar exploration CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/exploration,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/spt
	name = "Interstellar command support"
	departments = SPT

	utility_under = /obj/item/clothing/under/solgov/utility/army/urban/command
	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/command,
						/obj/item/clothing/suit/storage/solgov/utility/army/navy/command,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)

/decl/hierarchy/mil_uniform/army/spt/officer
	name = "Interstellar command support CO"
	min_rank = 11

	utility_extra = list(/obj/item/clothing/head/ushanka/solgov/army/green,
						/obj/item/clothing/head/ushanka/solgov/army,
						/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/army,
						/obj/item/clothing/under/solgov/utility/army/command,
						/obj/item/clothing/head/solgov/utility/army/urban,
						/obj/item/clothing/gloves/thick)

	service_under = /obj/item/clothing/under/solgov/service/army/command
	service_skirt = /obj/item/clothing/under/solgov/service/army/command/skirt
	service_hat = /obj/item/clothing/head/solgov/service/army/command
	service_extra = list(/obj/item/clothing/head/solgov/service/army/garrison/command)

	dress_under = /obj/item/clothing/under/solgov/mildress/army/command
	dress_skirt = /obj/item/clothing/under/solgov/mildress/army/command/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/army/command
	dress_hat = /obj/item/clothing/head/solgov/dress/army/command
	dress_extra = list(/obj/item/material/sword/replica/officersword/armyofficer)
