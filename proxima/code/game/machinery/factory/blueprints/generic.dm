/obj/item/factory_blueprint/cigarette
	name = "cigarette refinery blueprint"
	desc = "A blueprint that allows factory to re-create a cigarette butt back into usable shape."

	production_path = /obj/item/clothing/mask/smokable/cigarette
	production_time = 5
	required_materials = list(
		/obj/item/trash/cigbutt = 1,
		/obj/item/paper = 1,
		)

/obj/item/factory_blueprint/flarebox
	name = "flarebox blueprint"
	desc = "A blueprint that allows factory to create flare box."

	production_path = /obj/item/storage/fancy/supply_box/flare
	production_time = 15
	required_materials = list(
		/obj/item/stack/material/steel = 5,
		/obj/item/stack/material/phoron = 1,
		)

/obj/item/factory_blueprint/illiminationbox
	name = "light grenade box blueprint"
	desc = "A blueprint that allows factory to create light grenade box."

	production_path = /obj/item/storage/fancy/supply_box/flare
	production_time = 15
	required_materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/aluminium = 5,
		/obj/item/stack/material/phoron = 2,
		)
