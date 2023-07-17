/obj/effect/baseturf_helper //Set the baseturfs of every turf in the /area/ it is placed.
	name = "baseturf editor"
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = "standart"
	var/baseturf

	layer = POINT_LAYER

/obj/effect/baseturf_helper/Initialize(mapload)
	. = ..()
	var/area/thearea = get_area(src)
	for(var/turf/T in get_area_turfs(thearea, z))
		replace_baseturf(T)
	return INITIALIZE_HINT_QDEL

/obj/effect/baseturf_helper/proc/replace_baseturf(turf/thing)
	if(thing.baseturf != thing.type)
		thing.baseturf = baseturf

/obj/effect/baseturf_helper/space
	name = "space baseturf editor"
	baseturf = /turf/space

/obj/effect/baseturf_helper/asteroid
	name = "asteroid baseturf editor"
	baseturf = /turf/simulated/floor/plating/asteroid

/obj/effect/baseturf_helper/asteroid/airless
	name = "asteroid airless baseturf editor"
	baseturf = /turf/simulated/floor/plating/asteroid/airless

/obj/effect/baseturf_helper/asteroid/basalt
	name = "asteroid basalt baseturf editor"
	baseturf = /turf/simulated/floor/plating/asteroid/basalt

/obj/effect/baseturf_helper/asteroid/snow
	name = "asteroid snow baseturf editor"
	baseturf = /turf/simulated/floor/plating/asteroid/snow

/obj/effect/baseturf_helper/beach/sand
	name = "beach sand baseturf editor"
	baseturf = /turf/simulated/floor/beach/sand

/obj/effect/baseturf_helper/beach/water
	name = "water baseturf editor"
	baseturf = /turf/simulated/floor/beach/water

/obj/effect/baseturf_helper/lava
	name = "lava baseturf editor"
	baseturf = /turf/simulated/floor/plating/lava/smooth

/obj/effect/baseturf_helper/lava_land/surface
	name = "lavaland baseturf editor"
	baseturf = /turf/simulated/floor/plating/lava/smooth/lava_land_surface

/obj/effect/mapping_helpers
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = "standart"
	layer = 10
	var/late = FALSE

/obj/effect/mapping_helpers/Initialize(mapload)
	..()
	return late ? INITIALIZE_HINT_LATELOAD : qdel(src) // INITIALIZE_HINT_QDEL <-- Doesn't work

/obj/effect/mapping_helpers/airlock
	layer = DOOR_HELPER_LAYER
	late = TRUE
	var/list/blacklist = list(/obj/machinery/door/firedoor, /obj/machinery/door/poddoor, /obj/machinery/door/unpowered)

/obj/effect/mapping_helpers/airlock/Initialize(mapload)
	. = ..()
	if(!mapload)
		log_world("[src] spawned outside of mapload!")
		return

	if(!(locate(/obj/machinery/door) in get_turf(src)))
		log_world("[src] failed to find an airlock at [AREACOORD(src)]")

	for(var/obj/machinery/door/D in get_turf(src))
		if(!is_type_in_list(D, blacklist))
			payload(D)

	return INITIALIZE_HINT_QDEL

/obj/effect/mapping_helpers/airlock/proc/payload(obj/machinery/door/airlock/payload)
	return

/obj/effect/mapping_helpers/airlock/unres
	name = "airlock unresctricted side helper"
	icon_state = "airlock_unres_helper"

/obj/effect/mapping_helpers/airlock/unres/payload(obj/machinery/door/airlock)
	airlock.unres_sides ^= dir
	airlock.update_icon()

/obj/effect/mapping_helpers/airlock/locked
	name = "airlock lock helper"
	icon_state = "airlock_locked_helper"

/obj/effect/mapping_helpers/airlock/locked/payload(obj/machinery/door/airlock/airlock)
	if(airlock.locked)
		log_world("[src] at [AREACOORD(src)] tried to bolt [airlock] but it's already locked!")
	else
		airlock.locked = TRUE

/obj/effect/mapping_helpers/no_lava
	icon_state = "no_lava"

/obj/effect/mapping_helpers/no_lava/New()
	var/turf/T = get_turf(src)
	T.flags |= NO_LAVA_GEN
	. = ..()

/obj/effect/mapping_helpers/light
	icon_state = "sunlight_helper"
	light_color = null
	light_power = 1
	light_range = 10

/obj/effect/mapping_helpers/light/New()
	var/turf/T = get_turf(src)
	T.light_color = light_color
	T.light_power = light_power
	T.light_range = light_range
	. = ..()

/obj/effect/mapping_helpers/machinery
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = ""
	layer = BELOW_MOB_LAYER
	late = TRUE

/obj/effect/mapping_helpers/machinery/Initialize(mapload)
	. = ..()
	if(!mapload)
		log_world("[src] spawned outside of mapload!")
		return

	if(!(locate(/obj/machinery) in get_turf(src)))
		log_world("[src] failed to find any machinery [AREACOORD(src)]")

	for(var/obj/machinery/M in get_turf(src))
		payload(M)

	return INITIALIZE_HINT_QDEL

/obj/effect/mapping_helpers/machinery/proc/payload(obj/machinery/payload)
	return

/obj/effect/mapping_helpers/machinery/damaged
	name = "damaged machinery helper"
	icon_state = "blocker"

/obj/effect/mapping_helpers/machinery/destroyed
	name = "damaged machinery helper"
	icon_state = "removal"

/obj/effect/mapping_helpers/machinery/damaged/payload(obj/machinery/M)
    M.take_damage(M.obj_integrity - M.integrity_failure)

/obj/effect/mapping_helpers/machinery/destroyed/payload(obj/machinery/M)
    M.take_damage(M.obj_integrity)

// Used by mapmerge2 to denote the existence of a merge conflict (or when it has to complete a "best intent" merge where it dumps the movable contents of an old key and a new key on the same tile).
// We define it explicitly here to ensure that it shows up on the highest possible plane (while giving off a verbose icon) to aide mappers in resolving these conflicts.
// DO NOT USE THIS IN NORMAL MAPPING!!! Linters WILL fail.

/obj/merge_conflict_marker
	name = "Merge Conflict Marker - DO NOT USE"
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = "merge_conflict_marker"
	desc = "If you are seeing this in-game: someone REALLY, REALLY, REALLY fucked up. Please make an issue report on GitHub or contact a coder as soon as possible."
	plane = POINT_LAYER

///We REALLY do not want un-addressed merge conflicts in maps for an inexhaustible list of reasons. This should help ensure that this will not be missed in case linters fail to catch it for any reason what-so-ever.
/obj/merge_conflict_marker/Initialize(mapload)
	. = ..()
	var/msg = "HEY, LISTEN!!! Merge Conflict Marker detected at [AREACOORD(src)]! Please manually address all potential merge conflicts!!!"
	warning(msg)
	to_chat(world, "<span class='boldannounce'>[msg]</span>")
