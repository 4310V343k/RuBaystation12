// Server startup. Please proceed to the Lobby.
/world/TgsInitializationComplete()
	. = ..()
	var/name = GLOB.using_map.full_name
	send2chat("**Внимание, <@&839057002046947329>**\nНачинается смена на **[name]**.\n*Заходите на <[get_world_url()]>*", "launch-alert")

// The round has been ended
/hook/roundend/proc/SendTGSRoundEnd()
	var/list/data = GLOB.using_map.roundend_statistics()
	var/name = GLOB.using_map.full_name
	if (data != null)
		var/v1 = data["clients"]
		var/v2 = data["surviving_humans"]
		var/v3 = data["surviving_total"]//required field for roundend webhook!
		var/v4 = data["ghosts"] //required field for roundend webhook!
		var/v5 = data["escaped_humans"]
		var/v6 = data["escaped_total"]
		var/v7 = data["left_behind_total"] //players who didnt escape and aren't on the station.
		var/v8 = data["offship_players"]
		send2chat("**Раунд на [name] завершен.**\n__Статистика:__\n*Выжило экипажа: **[v2]** (из которых органиков: **[v3])***\n*Эвакуированно экипажа: **[v5]** (из которых органиков: **[v6]**)*\n*Выживший экипаж, но брошенный умирать: **[v7]***\n*Выжившие не члены экипажа: **[v8]***\n*Всего игроков: **[v1]** (из них наблюдателей: **[v4]**)*", "launch-alert")
	else
		send2chat("**Раунд на [name] завершен.**\n__Статистики нет.__", "launch-alert")

	if (LAZYLEN(GLOB.round_end_notifiees))
		send2chat("*Раунд закончился, ребятки. Всем по слапу!*\n[GLOB.round_end_notifiees.Join(", ")]", "bot-spam")
	return TRUE

/hook/banned/proc/SendTGSBan(list/args)
	var/bantypeString = ""
	switch(args[1])
		if (BANTYPE_JOB_PERMA)
			bantypeString = "*__**ПЕРМА ДЖОБКА НА ПРОФЫ:**__ \n[args[4]]*"
		if (BANTYPE_JOB_TEMP)
			bantypeString = "*__временно на профы:__ \b[args[4]]*\n**5.1. Бан спадет через:** __*[args[5]]*__"
		if (BANTYPE_PERMA)
			bantypeString = "__***ПЕРМА***__"
		if (BANTYPE_TEMP)
			bantypeString = "__*на время*__.\n**5.1. Бан спадет через:** __*[args[5]]*__"
		else
			bantypeString = "__***капец как забанил...***__"
	send2chat(":KKomrade: ***Новый жбан***\n**1. Ckey осужденного:** __*[args[3]]*__\n**2. Ckey администратора:**__*[args[2]]*__\n**3. Сервер:**__*PRX*__\n**4. Причина:**\n ```[args[6]]```\n**5. Наказание и длительность:** [bantypeString]", "notes-hub")

/hook/unbanned/proc/SendTGSUnBan(list/args)
	var/bantypeString = ""
	switch(args[1])
		if (BANTYPE_JOB_PERMA)
			bantypeString = "__***пермабан на профессию**: [args[4]]*__"
		if (BANTYPE_JOB_TEMP)
			bantypeString = "__*временный бан на профессию: [args[4]]*__"
		if (BANTYPE_PERMA)
			bantypeString = "__***ПЕРМАБАН***__"
		if (BANTYPE_TEMP)
			bantypeString = "__*временный бан*__"
		else
			bantypeString = "__***капец как разбанил...***__"
	send2chat(":hoy: ***Амнистия***\n__**1. Ckey помилованного:** __*[args[3]]*__\n**2. Ckey покровителя:** __*[args[2]]***__**3. Сервер:** __*PRX*__\n**4. Что прощено:** [bantypeString]", "notes-hub")

/hook/playerNotes/proc/SendTGSNotes(list/args)
	send2chat(":really: ***Доносики***\n**1. Ckey обвиняемого:** __*[args[2]]*__\n**2. Ckey доносчика:** __*[args[1]]*__\n**3. Сервер:** __*PRX*__\n**4. Доносик:** __*[args[3]]*__\n**5. Тип:** __*Нотес (стаффварны не поддерживаются)*__\n**6. Срок действия доноса:** __*INFINITY (а как иначе то?)*__", "notes-hub")
