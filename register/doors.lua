-- TRAPDOOR STEEL (UNLOCKED)
doors.register_trapdoor("steelplus:steel_trapdoor_unlocked", {
	description = "Steel Trapdoor (Unlocked)",
	inventory_image = "steel_trapdoor.png",
	wield_image = "steel_trapdoor.png",
	tile_front = "steel_trapdoor.png",
	tile_side = "steel_trapdoor_side.png",
	protected = false,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, door = 1},
})
minetest.register_craft({
	output = 'steelplus:steel_trapdoor_unlocked 2',
	recipe = {
		{'doors:trapdoor_steel',},
	}
})