-- FUNCTION FOR TOGGLE DOORS [FORKED FROM XDECOR MOD]
minetest.setting_set("nodetimer_interval", 0.1)

local function door_toggle(pos_actuator, pos_door, player)
	local actuator = minetest.get_node(pos_actuator)
	local door = doors.get(pos_door)

	if actuator.name:sub(-4) == "_off" then
		minetest.set_node(pos_actuator,
			{name=actuator.name:gsub("_off", "_on"), param2=actuator.param2})
	end
	door:open(placer) -- open like 'placer'
	
	minetest.after(2, function()
		if minetest.get_node(pos_actuator).name:sub(-3) == "_on" then
			minetest.set_node(pos_actuator,
				{name=actuator.name, param2=actuator.param2})
		end
		door:close(placer) -- close like 'placer'
	end)
end

-- CUSTOM COLORS FOR SECURITY LEVELS
for _, c in pairs({"red", "yellow", "blue"}) do
minetest.register_node("steelplus:"..c.."_access_card_reader_off", { -- access card readers off!
	description = c:gsub("^%l", string.upper).." Access Card Reader",
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steel_dark_block.png", 
		"steelplus_"..c.."_access_card_reader_off.png", 
		"steelplus_"..c.."_access_card_reader_off.png"
	},
	groups = {cracky=1},
	on_rightclick =	function(pos, node, clicker, itemstack)
		local item = clicker:get_wielded_item()
		if item:get_name() == "steelplus:"..c.."_access_card" then
				if not doors.get then return itemstack end
					local minp = {x=pos.x-2, y=pos.y-1, z=pos.z-2}
					local maxp = {x=pos.x+2, y=pos.y+1, z=pos.z+2}
					local doors = minetest.find_nodes_in_area(minp, maxp, "group:door")

					for i=1, #doors do
						door_toggle(pos, doors[i], clicker)
					-----------------------------------------------
					local name = clicker:get_player_name() -- If have an Access Card...
					minetest.chat_send_player(name, c:gsub("^%l", string.upper).." Access Granted!") -- send this message...
					minetest.sound_play("steelplus_access_granted", { -- and play this sound!.
						to_player = name,
						gain = 10.0,
					})
					-----------------------------------------------
				end
				return itemstack
		else 
		local name = clicker:get_player_name() -- If not have an Access Card...
		minetest.chat_send_player(name, "You need a "..c:gsub("^%l", string.upper).." Access Card to open this Door!") -- send this message...
		minetest.sound_play("steelplus_access_denied", { -- and play this sound!.
						to_player = name,
						gain = 10.0,
					})
		end
	end,
})
minetest.register_craft({
	output = 'steelplus:'..c..'_access_card_reader_off',
	recipe = {
		{'dye:'..c,'default:mese_crystal_fragment','steelplus:steel_dark_block'},
	}
})
minetest.register_node("steelplus:"..c.."_access_card_reader_on", { -- access card readers on!
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	paramtype2 = "facedir",
	tiles = {
		"steel_dark_block.png", "steel_dark_block.png", 
		"steel_dark_block.png", "steel_dark_block.png", 
		"steelplus_"..c.."_access_card_reader_on.png", 
		"steelplus_"..c.."_access_card_reader_on.png"
	},
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = 'steelplus:'..c..'_access_card_reader_off',
})
minetest.register_craftitem("steelplus:"..c.."_access_card", { -- access cards, no recipe, obviously!
	description = c:gsub("^%l", string.upper).." Access Card",
	inventory_image = c.."_access_card.png",
	groups = {not_in_creative_inventory=1},
})
end
