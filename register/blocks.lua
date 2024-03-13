-- BRICK BLOCK
minetest.register_node("steelplus:steel_brick_block", {
	description = "Steel Brick Block",
	tiles = {"steel_brick_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})
minetest.register_craft({
	output = 'steelplus:steel_brick_block 4',
	recipe = {
		{'default:steelblock', 'default:steelblock'},
		{'default:steelblock', 'default:steelblock'},
	}
})

-- DARK BLOCK
minetest.register_node("steelplus:steel_dark_block", {
	description = "Steel Dark Block",
	tiles = {"steel_dark_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})
minetest.register_craft({
	output = 'steelplus:steel_dark_block',
	recipe = {
		{'dye:black','default:steelblock',}
	}
})

-- TRAPDOOR BLOCK
minetest.register_node("steelplus:steel_trapdoor_block", {
	description = "Steel Trapdoor Block",
	tiles = {"steel_trapdoor_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_metal_defaults(),
})
minetest.register_craft({
	output = 'steelplus:steel_trapdoor_block',
	recipe = {
		{'steelplus:steel_trapdoor_unlocked','steelplus:steel_dark_block',},
	}
})
