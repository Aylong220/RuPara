/turf/simulated/floor/indestructible

/turf/simulated/floor/indestructible/ex_act(severity)
	return

/turf/simulated/floor/indestructible/blob_act(obj/structure/blob/B)
	return

/turf/simulated/floor/indestructible/singularity_act()
	return

/turf/simulated/floor/indestructible/singularity_pull(S, current_size)
	return

/turf/simulated/floor/indestructible/narsie_act()
	return

/turf/simulated/floor/indestructible/ratvar_act()
	return

/turf/simulated/floor/indestructible/burn_down()
	return

/turf/simulated/floor/indestructible/attackby(obj/item/I, mob/user, params)
	return

/turf/simulated/floor/indestructible/attack_hand(mob/user)
	return

/turf/simulated/floor/indestructible/attack_animal(mob/living/simple_animal/M)
	return

/turf/simulated/floor/indestructible/mech_melee_attack(obj/mecha/M)
	return

/turf/simulated/floor/indestructible/plating
	name = "plating"
	icon_state = "plating"
	icon = 'icons/turf/floors/plating.dmi'
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/floor/indestructible/necropolis
	name = "necropolis floor"
	desc = "It's regarding you suspiciously."
	icon = 'icons/turf/floors.dmi'
	icon_state = "necro1"
	baseturf = /turf/simulated/floor/indestructible/necropolis
	oxygen = 14
	nitrogen = 23
	temperature = 300
	planetary_atmos = TRUE
	footstep = FOOTSTEP_LAVA
	barefootstep = FOOTSTEP_LAVA
	clawfootstep = FOOTSTEP_LAVA
	heavyfootstep = FOOTSTEP_LAVA

/turf/simulated/floor/indestructible/necropolis/Initialize(mapload)
	. = ..()
	if(prob(12))
		icon_state = "necro[rand(2,3)]"

/turf/simulated/floor/indestructible/necropolis/air
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/indestructible/boss //you put stone tiles on this and use it as a base
	name = "necropolis floor"
	icon = 'icons/turf/floors/boss_floors.dmi'
	icon_state = "boss"
	baseturf = /turf/simulated/floor/indestructible/boss
	oxygen = 14
	nitrogen = 23
	temperature = 300
	planetary_atmos = TRUE

/turf/simulated/floor/indestructible/boss/air
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/indestructible/hierophant
	name = "floor"
	icon = 'icons/turf/floors/hierophant_floor.dmi'
	icon_state = "floor"
	oxygen = 14
	nitrogen = 23
	temperature = 300
	planetary_atmos = TRUE
	smooth = SMOOTH_TRUE

/turf/simulated/floor/indestructible/hierophant/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	return FALSE

/turf/simulated/floor/indestructible/hierophant/two

/turf/simulated/floor/indestructible/vox
	oxygen = 0 // I hate this
	nitrogen = 100

/turf/simulated/floor/indestructible/carpet
	name = "Carpet"
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	smooth = SMOOTH_TRUE
	canSmoothWith = null
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_CARPET_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/floor/indestructible/grass
	name = "grass patch"
	icon_state = "grass1"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/floor/indestructible/grass/Initialize(mapload)
	. = ..()
	icon_state = "grass[rand(1,4)]"

/turf/simulated/floor/indestructible/asteroid
	name = "sand"
	icon = 'icons/turf/floors/plating.dmi'
	icon_state = "asteroid"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/floor/indestructible/asteroid/Initialize(mapload)
	. = ..()
	if(prob(20))
		icon_state = "asteroid[rand(0,12)]"

/turf/simulated/floor/indestructible/abductor
	name = "alien floor"
	icon_state = "alienpod1"

/turf/simulated/floor/indestructible/abductor/Initialize(mapload)
	. = ..()
	icon_state = "alienpod[rand(1,9)]"

/turf/simulated/floor/indestructible/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/simulated/floor/indestructible/beach
	name = "Beach"
	icon = 'icons/misc/beach.dmi'
	var/water_overlay_image = null
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/turf/simulated/floor/indestructible/beach/Initialize(mapload)
	. = ..()
	if(water_overlay_image)
		var/image/overlay_image = image('icons/misc/beach.dmi', icon_state = water_overlay_image, layer = ABOVE_MOB_LAYER)
		overlay_image.plane = GAME_PLANE
		overlays += overlay_image

/turf/simulated/floor/indestructible/beach/sand
	name = "Sand"
	icon_state = "desert"
	mouse_opacity = MOUSE_OPACITY_ICON
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY


/turf/simulated/floor/indestructible/beach/sand/Initialize(mapload)
	. = ..()			//adds some aesthetic randomness to the beach sand
	icon_state = pick("desert", "desert0", "desert1", "desert2", "desert3", "desert4")

/turf/simulated/floor/indestructible/beach/sand/dense			//for boundary "walls"
	density = TRUE

/turf/simulated/floor/indestructible/beach/coastline
	name = "Coastline"
	//icon = 'icons/misc/beach2.dmi'
	//icon_state = "sandwater"
	icon_state = "beach"
	water_overlay_image = "water_coast"
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/simulated/floor/indestructible/beach/coastline/dense		//for boundary "walls"
	density = TRUE

/turf/simulated/floor/indestructible/beach/water
	name = "Shallow Water"
	icon_state = "seashallow"
	water_overlay_image = "water_shallow"
	var/obj/machinery/poolcontroller/linkedcontroller = null
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/simulated/floor/indestructible/beach/water/Entered(atom/movable/AM, atom/OldLoc)
	. = ..()
	if(!linkedcontroller)
		return
	if(ismob(AM))
		linkedcontroller.mobinpool += AM

/turf/simulated/floor/indestructible/beach/water/Exited(atom/movable/AM, atom/newloc)
	. = ..()
	if(!linkedcontroller)
		return
	if(ismob(AM))
		linkedcontroller.mobinpool -= AM

/turf/simulated/floor/indestructible/beach/water/InitializedOn(atom/A)
	if(!linkedcontroller)
		return
	if(istype(A, /obj/effect/decal/cleanable)) // Better a typecheck than looping through thousands of turfs everyday
		linkedcontroller.decalinpool += A

/turf/simulated/floor/indestructible/beach/water/dense			//for boundary "walls"
	density = TRUE

/turf/simulated/floor/indestructible/beach/water/edge_drop
	name = "Water"
	icon_state = "seadrop"
	water_overlay_image = "water_drop"

/turf/simulated/floor/indestructible/beach/water/drop
	name = "Water"
	icon = 'icons/turf/floors/seadrop.dmi'
	icon_state = "seadrop"
	water_overlay_image = null
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/simulated/floor/indestructible/beach/water/drop, /turf/simulated/floor/indestructible/beach/water/drop/dense,
		/turf/simulated/floor/indestructible/beach/water, /turf/simulated/floor/indestructible/beach/water/dense,
		/turf/simulated/floor/indestructible/beach/water/edge_drop)
	var/obj/effect/beach_drop_overlay/water_overlay

/turf/simulated/floor/indestructible/beach/water/drop/Initialize(mapload)
	. = ..()
	water_overlay = new(src)

/turf/simulated/floor/indestructible/beach/water/drop/Destroy()
	QDEL_NULL(water_overlay)
	return ..()

/obj/effect/beach_drop_overlay
	name = "Water"
	icon = 'icons/turf/floors/seadrop-o.dmi'
	layer = MOB_LAYER + 0.1
	smooth = SMOOTH_TRUE
	anchored = 1
	canSmoothWith = list(
		/turf/simulated/floor/indestructible/beach/water/drop, /turf/simulated/floor/indestructible/beach/water/drop/dense,
		/turf/simulated/floor/indestructible/beach/water, /turf/simulated/floor/indestructible/beach/water/dense,
		/turf/simulated/floor/indestructible/beach/water/edge_drop)

/turf/simulated/floor/indestructible/beach/water/drop/dense
	density = TRUE

/turf/simulated/floor/indestructible/beach/water/deep
	name = "Deep Water"
	icon_state = "seadeep"
	water_overlay_image = "water_deep"

/turf/simulated/floor/indestructible/beach/water/deep/dense
	density = TRUE

/turf/simulated/floor/indestructible/beach/water/deep/wood_floor
	name = "Sunken Floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "wood"

/turf/simulated/floor/indestructible/beach/water/deep/sand_floor
	name = "Sea Floor"
	icon_state = "sand"

/turf/simulated/floor/indestructible/beach/water/deep/rock_wall
	name = "Reef Stone"
	icon_state = "desert7"
	density = TRUE
	opacity = TRUE
	explosion_block = 2
	mouse_opacity = MOUSE_OPACITY_ICON

//Dune event turfs

/turf/simulated/floor/indestructible/brick
	name = "brick floor"
	icon = 'icons/misc/desert.dmi'
	icon_state = "brick"
	baseturf = /turf/simulated/floor/indestructible/dune_sand

/turf/simulated/floor/indestructible/dune_sand
	name = "dune sand"
	icon = 'icons/misc/desert.dmi'
	icon_state = "sand"
	baseturf = /turf/simulated/floor/indestructible/dune_sand/dug
	temperature = 325
	planetary_atmos = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_SAND
	var/environment_type = "sand"
	var/obj/item/stack/digResult = /obj/item/stack/ore/glass
	var/floor_variance = 5
	var/dug

/turf/simulated/floor/indestructible/dune_sand/Initialize(mapload)
	var/proper_name = name
	. = ..()
	name = proper_name
	if(prob(floor_variance))
		icon_state = "[environment_type][rand(1,4)]"

/turf/simulated/floor/indestructible/dune_sand/proc/getDug()
	new digResult(src, 5)
	icon_plating = "[environment_type]_dug"
	icon_state = "[environment_type]_dug"
	dug = TRUE

/turf/simulated/floor/indestructible/dune_sand/proc/can_dig(mob/user)
	if(!dug)
		return TRUE
	if(user)
		to_chat(user, "<span class='notice'>Looks like someone has dug here already.</span>")

/turf/simulated/floor/indestructible/dune_sand/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/simulated/floor/indestructible/dune_sand/burn_tile()
	return

/turf/simulated/floor/indestructible/dune_sand/MakeSlippery(wet_setting)
	return

/turf/simulated/floor/indestructible/dune_sand/MakeDry(wet_setting)
	return

/turf/simulated/floor/indestructible/dune_sand/remove_plating()
	return

/turf/simulated/floor/crowbar_act(mob/user, obj/item/I)
	return

/turf/simulated/floor/indestructible/dune_sand/ex_act(severity)
	if(!can_dig())
		return
	switch(severity)
		if(3)
			return
		if(2)
			if(prob(20))
				getDug()
		if(1)
			getDug()

/turf/simulated/floor/indestructible/dune_sand/attackby(obj/item/I, mob/user, params)
	//note that this proc does not call ..()
	if(!I|| !user)
		return FALSE

	if((istype(I, /obj/item/shovel) || istype(I, /obj/item/pickaxe)))
		if(!can_dig(user))
			return TRUE

		var/turf/T = get_turf(user)
		if(!istype(T))
			return

		to_chat(user, "<span class='notice'>You start digging...</span>")

		playsound(src, I.usesound, 50, TRUE)
		if(do_after(user, 40 * I.toolspeed * gettoolspeedmod(user), target = src))
			if(!can_dig(user))
				return TRUE
			to_chat(user, "<span class='notice'>You dig a hole.</span>")
			getDug()
			return TRUE

	else if(istype(I, /obj/item/storage/bag/ore))
		var/obj/item/storage/bag/ore/S = I
		if(S.pickup_all_on_tile)
			for(var/obj/item/stack/ore/O in contents)
				O.attackby(I, user)
				return

	else if(istype(I, /obj/item/stack/tile))
		var/obj/item/stack/tile/Z = I
		if(!Z.use(1))
			return
		if(istype(Z, /obj/item/stack/tile/plasteel)) // Turn asteroid floors into plating by default
			ChangeTurf(/turf/simulated/floor/plating, keep_icon = FALSE)
		else
			ChangeTurf(Z.turf_type, keep_icon = FALSE)
		playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)

/turf/simulated/floor/indestructible/dune_sand/smooth
	icon_state = "smooth"
	smooth = SMOOTH_MORE | SMOOTH_BORDER
	canSmoothWith = list(/turf/simulated/floor/indestructible/dune_sand, /turf/simulated/floor/indestructible/dune_sand/smooth)

/turf/simulated/floor/indestructible/dune_sand/dug
	name = "sand dug"
	icon_state = "sand_dug"
