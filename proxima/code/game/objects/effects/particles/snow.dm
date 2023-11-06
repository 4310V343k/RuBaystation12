/particles/snow //byond ref code, lol
	width = 500
	height = 500
	count = 2500
	spawning = 12
	bound1 = list(-1000, -300, -1000)
	lifespan = 600
	fade = 50
	position = generator("box", list(-300,250,0), list(300,300,50))
	gravity = list(0, -1)
	friction = 0.3
	drift = generator("sphere", 0, 2)

/obj/screenfilter/snow
	mouse_opacity = 0
	screen_loc = "CENTER"
	particles = new/particles/snow

/obj/screenfilter/snow/Fade()
	animate(src, alpha=0, time=10) //i've spent too much time to make this shit pass unit tests
	..()

/obj/screenfilter/proc/Fade() //overwrite to create cool fading effects :call_me:
	qdel(src)
