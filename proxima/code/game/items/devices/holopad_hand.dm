#define CALL_NONE 0
#define CALL_CALLING 1
#define CALL_RINGING 2
#define CALL_IN_CALL 3

/obj/item/device/holopad
	name = "Tele-pda"
	desc = "Tele-pda is a convenient device that allows you to talk over a closed third-party connection that will protect you from sudden wiretapping or intrusion into your conversations. Rejoice in such a useful thing."
	icon = 'proxima/icons/obj/holopda.dmi'
	icon_state = "holopad"
	item_state = "card-id"
	w_class = ITEM_SIZE_TINY
	var/voice
	var/id
	var/uniq_id
	var/obj/item/device/holopad/abonent = null
	var/call_state = CALL_NONE
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 2, TECH_MAGNET = 4)

/obj/item/device/holopad/Initialize()
	uniq_id = random_id("holopad_device", 00000, 99999)
	id = rand(1000, 9999)
	name = "[initial(name)] [id] #[uniq_id]"
	voice = "Holopad [id]"
	GLOB.listening_objects += src
	. = ..()

/obj/item/device/holopad/Destroy()
	GLOB.listening_objects -= src
	abonent = null
	. = ..()


/obj/item/device/holopad/verb/setID()
	set name="Set ID"
	set category = "Object"
	set src in usr
	var/newid = sanitize(input(usr, "What would be new ID?") as null|text, MAX_NAME_LEN)
	if(newid && CanPhysicallyInteract(usr))
		id = newid
		name = "[initial(name)] [id] #[uniq_id]"

/obj/item/device/holopad/proc/getName(override_busy = 0)
	if(call_state!=CALL_NONE && !override_busy)
		return "Holopad [id] #[uniq_id] - busy"
	else
		return "Holopad [id] #[uniq_id]"

/obj/item/device/holopad/proc/incall(obj/item/device/holopad/caller)
	if(call_state != CALL_NONE)
		return FALSE
	abonent = caller
	call_state = CALL_RINGING
	icon_state = "holopad_ringing"
	desc = "[initial(desc)] Incoming call from [caller.getName()]."
	INVOKE_ASYNC(src, .proc/ring)
	return TRUE

/obj/item/device/holopad/proc/ring()
	if(call_state != CALL_RINGING)
		return
	audible_message(SPAN_WARNING("Something vibrates.."), hearing_distance = 4)
	addtimer(CALLBACK(src, .proc/ring), 50)

/obj/item/device/holopad/proc/placeCall(mob/user)
	var/list/Targets = list()
	for(var/obj/item/device/holopad/H in GLOB.listening_objects)
		if(H == src)
			continue
		Targets[H.getName()] = H
	var/selection = input("Who do you want to call?") as null|anything in Targets
	if(!selection)
		return
	var/obj/item/device/holopad/target = Targets[selection]
	if(!target)
		return
	if(target.incall(src))
		call_state = CALL_CALLING
		abonent = target
		icon_state = "holopad_calling"
		to_chat(user, SPAN_NOTICE("Calling [sanitize(abonent.getName(1))]"))
	else
		to_chat(user, SPAN_WARNING("Remote device is busy"))

/obj/item/device/holopad/proc/acceptCall()
	if(call_state == CALL_RINGING)
		if(abonent && abonent.call_state == CALL_CALLING)
			abonent.acceptCall()
			call_state = CALL_IN_CALL
			icon_state = "holopad_in_call"

			audible_message("<span class='name'>[voice]</span> transmits, \"Connection established\"", hearing_distance = 1)
		else
			call_state = CALL_NONE
			icon_state = initial(icon_state)
			desc = initial(desc)
			abonent = null

	else if(call_state == CALL_CALLING)
		call_state = CALL_IN_CALL
		icon_state = "holopad_in_call"

		audible_message("<span class='name'>[voice]</span> transmits, \"Connection established\"", hearing_distance = 1)

/obj/item/device/holopad/proc/hangUp(remote = 0)
	if(!remote && abonent)
		abonent.hangUp(1)

	if(call_state==CALL_NONE)
		return

	audible_message(SPAN_WARNING("Connection closed"), hearing_distance = 4)
	call_state = CALL_NONE
	icon_state = initial(icon_state)
	desc = initial(desc)
	abonent = null



/obj/item/device/holopad/attack_self(mob/user)
	switch(call_state)
		if(CALL_NONE)
			placeCall()
		if(CALL_CALLING)
			hangUp()
		if(CALL_RINGING)
			acceptCall()
		if(CALL_IN_CALL)
			hangUp()

/obj/item/device/holopad/hear_talk(mob/user,  datum/language/speaking)
	if(call_state == CALL_IN_CALL)
		abonent.receive(speaking, user == loc)

/obj/item/device/holopad/proc/receive(speaking, mob/user)
	var/list/listening = get_mobs_or_objects_in_view(3, src)

	for(var/mob/observer/ghost/G in GLOB.ghost_mob_list)
		if(get_dist(src, G) > world.view && G.get_preference_value(/datum/client_preference/ghost_ears) != GLOB.PREF_ALL_SPEECH)
			continue
		listening |= G

	if(!user)
		voice = "Tele-link Background Voice"
	for(var/mob/M in listening)
		to_chat(M, "<span class='name'>[voice]</span> transmits, \"[speaking]\" ")

/obj/item/device/holopad/wrist
	name = "Tele-wrist"
	desc = "The tele-wrist is a useful device if it is inconvenient for you to hold your tele-pda to your ear, now you can hook it on your hand and chat while jogging or working."
	icon = 'proxima/icons/obj/telewatch.dmi'
	slot_flags = SLOT_GLOVES

#undef CALL_NONE
#undef CALL_CALLING
#undef CALL_RINGING
#undef CALL_IN_CALL
