#define ONETILE 32 //A single normal tile in pixels

/mob/verb/focus_view()
	set name = "Focus View"
	set desc = "Focus your eyes on distant objects."
	set category = "IC"
	set src = usr

	if((src.client.pixel_y != 0)||(src.client.pixel_x != 0))
		to_chat(usr, SPAN_WARNING("You de-focused your gaze on distant objects"))
		src.client.pixel_y = 0
		src.client.pixel_x = 0
		return

	src.reset_view(src)


	switch(src.dir)
		if(NORTH)
			to_chat(usr, SPAN_WARNING("You focused your gaze on distant objects"))
			src.client.pixel_y = ONETILE * 10
		if(SOUTH)
			to_chat(usr, SPAN_WARNING("You focused your gaze on distant objects"))
			src.client.pixel_y = ONETILE * -10
		if(EAST)
			to_chat(usr, SPAN_WARNING("You focused your gaze on distant objects"))
			src.client.pixel_x = ONETILE * 10
		if(WEST)
			to_chat(usr, SPAN_WARNING("You focused your gaze on distant objects"))
			src.client.pixel_x = ONETILE * -10

#undef ONETILE
