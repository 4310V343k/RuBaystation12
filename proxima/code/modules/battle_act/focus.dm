#define ONETILE 32 //A single normal tile in pixels

/mob/verb/focus_view()
	set name = "Focus View"
	set desc = "Focus your eyes on distant objects."
	set category = "IC"
	set src = usr

	if((src.client.pixel_y != 0)||(src.client.pixel_x != 0))
		src.client.pixel_y = 0
		src.client.pixel_x = 0
		return

	src.reset_view(src)
	if(machine)
		to_chat(src,"<span class = 'notice'>Ты не можешь сделать этого!</span>")
		return

	switch(src.dir)
		if(NORTH)
			src.client.pixel_y = ONETILE * 5
		if(SOUTH)
			src.client.pixel_y = ONETILE * -5
		if(EAST)
			src.client.pixel_x = ONETILE * 5
		if(WEST)
			src.client.pixel_x = ONETILE * -5

#undef ONETILE
