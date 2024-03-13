----------------
--SCREEN BLOCK--
----------------
-- SCREEN BLOCK OFF
minetest.register_node("steelplus:steel_screen_block", {
	description = "Steel Screen Block",
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steelplus_screen_off.png"
	},
	groups = {cracky=1},
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, 
		{name="steelplus:steel_screen_block_on", param2 = minetest.get_node(pos).param2})
		end,
})
minetest.register_craft({
	output = 'steelplus:steel_screen_block',
	recipe = {
		{'default:glass','steelplus:steel_dark_block',},
	}
})
-- SCREEN BLOCK ON
minetest.register_node("steelplus:steel_screen_block_on", {
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		{name="steel_dark_block.png"},{name="steel_dark_block.png"},
		{name="steel_dark_block.png"},{name="steel_dark_block.png"},
		{name="steel_dark_block.png"},{name="steelplus_screen_on.png", 
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2},
	}},
	groups = {cracky=1, not_in_creative_inventory=1},
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, 
		{name="steelplus:steel_screen_block", param2 = minetest.get_node(pos).param2})
		end,
	drop = 'steelplus:steel_screen_block',
})

--------------
--RACK BLOCK--
--------------
-- RACK BLOCK OFF
minetest.register_node("steelplus:steel_rack_block", {
	description = "Steel Rack Block",
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steelplus_control_panel_off.png"
	},
	groups = {cracky=1},
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, 
		{name="steelplus:steel_rack_block_on", param2 = minetest.get_node(pos).param2})
		end,
})
minetest.register_craft({
	output = 'steelplus:steel_rack_block',
	recipe = {
		{'default:mese_crystal_fragment','steelplus:steel_dark_block',},
	}
})
-- RACK BLOCK ON
minetest.register_node("steelplus:steel_rack_block_on", {
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		{name="steel_dark_block.png"},{name="steel_dark_block.png"},
		{name="steel_dark_block.png"},{name="steel_dark_block.png"},
		{name="steel_dark_block.png"},{name="steelplus_control_panel_on.png", 
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3},
	}},
	groups = {cracky=1, not_in_creative_inventory=1},
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, 
		{name="steelplus:steel_rack_block", param2 = minetest.get_node(pos).param2})
		end,
	drop = 'steelplus:steel_rack_block',
})
