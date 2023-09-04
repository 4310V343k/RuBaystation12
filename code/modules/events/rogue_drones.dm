/datum/event/rogue_drone
	endWhen = 1000
	var/list/drones_list = list()

/datum/event/rogue_drone/start()
	var/n = rand(2, 6)
	var/I = 0
	while(I < n)
		var/speed = rand(1,3)
		var/dir = pick(GLOB.cardinal)
		var/Z = pick(affecting_z)
		var/turf/T = get_random_edge_turf(dir,TRANSITIONEDGE + 2, Z)
		if(istype(T,/turf/space))
			var/mob/living/simple_animal/hostile/retaliate/malf_drone/M
			M = new /mob/living/simple_animal/hostile/retaliate/malf_drone(T)
			drones_list.Add(M)
			if(prob(25))
				M.disabled = rand(15, 60)
			M.throw_at(get_random_edge_turf(GLOB.reverse_dir[dir],TRANSITIONEDGE + 2, Z), 5, speed)
		I++

/datum/event/rogue_drone/announce()
	command_announcement.Announce("Внимание. Неопознанные патрульные беспилотники обнаружены в непосредственной близости от [location_name()]", "Сенсорный Массив [location_name()]", zlevels = affecting_z)

/datum/event/rogue_drone/end()
	var/num_recovered = 0
	for(var/mob/living/simple_animal/hostile/retaliate/malf_drone/D in drones_list)
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, D.loc)
		sparks.start()
		D.z = GLOB.using_map.admin_levels[1]
		D.has_loot = 0

		qdel(D)
		num_recovered++

	if(num_recovered > drones_list.len * 0.75)
		command_announcement.Announce("Внимание. Датчики показывают, что неопознанный рой дронов покинул космическое пространство возле [location_name()].", "Сенсорный Массив [location_name()]", zlevels = affecting_z)
	else
		command_announcement.Announce("Внимание. Датчики показывают, что неопознанный рой дронов покинул космическое пространство возле [location_name()].", "Сенсорный Массив [location_name()]", zlevels = affecting_z)
