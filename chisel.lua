local USES = 200
local mode = {}
local function parti(pos)
  	minetest.add_particlespawner(25, 0.3,
		pos, pos,
		{x=2, y=0.2, z=2}, {x=-2, y=2, z=-2},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.2, 1,
		0.2, 2,
		true, "mychisel_parti.png")
end
	mode = "1"
minetest.register_tool( "mychisel:chisel",{
	description = "Chisel",
	inventory_image = "mychisel_chisel.png",
	wield_image = "mychisel_chisel.png",
on_use = function(itemstack, user, pointed_thing)
	if pointed_thing.type ~= "node" then
		return
	end
	local pos = pointed_thing.under
	local node = minetest.get_node(pos)
	local default_material = {
		{"default:cobble", "default_cobble", "Cobble"},
		{"default:sandstone","default_sandstone", "Sandstone"},
		{"default:clay","default_clay",  "Clay"},
		{"default:coalblock","default_coal_block",  "Coal Block"},
		{"default:stone","default_stone", "Stone"},
		{"default:desert_stone","default_desert_stone", "Desert Stone"},
		{"default:wood","default_wood", "Wood"},
		{"default:acacia_wood","default_acacia_wood", "Acacia Wood"},
		{"default:aspen_wood","default_aspen_wood", "Aspen Wood"},
		{"default:pine_wood","default_pine_wood", "Pine Wood"},
		{"default:desert_cobble","default_desert_cobble", "Desert Cobble"},
		{"default:junglewood","default_junglewood", "Jungle Wood"},
		{"default:sandstonebrick","default_sandstone_brick", "Sandstone Brick"},
		{"default:stonebrick","default_stone_brick", "Stone Brick"},
		{"default:desert_stonebrick","default_desert_stone_brick", "Desert Stone Brick"},
		}
	for i in ipairs (default_material) do
	local item = default_material [i][1]
	local mat = default_material [i][2]
	local desc = default_material [i][3]
	if pointed_thing.type ~= "node" then
		return
	end
	if minetest.is_protected(pos, user:get_player_name()) then
		minetest.record_protection_violation(pos, user:get_player_name())
		return
	end
	if mode == "1" then
		if node.name == item then
			   minetest.set_node(pos,{name = "mychisel:chiseled_"..mat.."1", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:chiseled_"..mat.."1" then
			   minetest.set_node(pos,{name = "mychisel:chiseled_"..mat.."2", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:chiseled_"..mat.."2" then
			   minetest.set_node(pos,{name = "mychisel:chiseled_"..mat.."3", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:chiseled_"..mat.."3" then
			   minetest.set_node(pos,{name = "mychisel:chiseled_"..mat.."4", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
	end
	if mode == "2" then
		if node.name == item then
			   minetest.set_node(pos,{name = "mychisel:horizontal_"..mat.."1", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:horizontal_"..mat.."1" then
			   minetest.set_node(pos,{name = "mychisel:horizontal_"..mat.."2", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:horizontal_"..mat.."2" then
			   minetest.set_node(pos,{name = "mychisel:horizontal_"..mat.."3", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:horizontal_"..mat.."3" then
			   minetest.set_node(pos,{name = "mychisel:horizontal_"..mat.."4", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
	end
	if mode == "3" then
		if node.name == item then
			   minetest.set_node(pos,{name = "mychisel:vertical_"..mat.."1", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:vertical_"..mat.."1" then
			   minetest.set_node(pos,{name = "mychisel:vertical_"..mat.."2", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:vertical_"..mat.."2" then
			   minetest.set_node(pos,{name = "mychisel:vertical_"..mat.."3", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:vertical_"..mat.."3" then
			   minetest.set_node(pos,{name = "mychisel:vertical_"..mat.."4", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
	end
	if mode == "4" then
		if node.name == item then
			   minetest.set_node(pos,{name = "mychisel:cross_"..mat.."1", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:cross_"..mat.."1" then
			   minetest.set_node(pos,{name = "mychisel:cross_"..mat.."2", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:cross_"..mat.."2" then
			   minetest.set_node(pos,{name = "mychisel:cross_"..mat.."3", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:cross_"..mat.."3" then
			   minetest.set_node(pos,{name = "mychisel:cross_"..mat.."4", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
	end
	if mode == "5" then
		if node.name == item then
			   minetest.set_node(pos,{name = "mychisel:square_"..mat.."1", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:square_"..mat.."1" then
			   minetest.set_node(pos,{name = "mychisel:square_"..mat.."2", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:square_"..mat.."2" then
			   minetest.set_node(pos,{name = "mychisel:square_"..mat.."3", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
		if node.name == "mychisel:square_"..mat.."3" then
			   minetest.set_node(pos,{name = "mychisel:square_"..mat.."4", param2=minetest.dir_to_facedir(user:get_look_dir())})
			   parti(pos)
		end
	end
end
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535 / (USES - 1))
	end
	return itemstack
end,
on_place = function(itemstack, user, pointed_thing)
	local usr = user:get_player_name()

		if mode == "1" then
			mode = "2"
			minetest.chat_send_player(usr,"Horizontal Groove")
		elseif mode == "2" then
			mode = "3"
			minetest.chat_send_player(usr,"Vertical Groove")
		elseif mode == "3" then
			mode = "4"
			minetest.chat_send_player(usr,"Cross Grooves")
		elseif mode == "4" then
			mode = "5"
			minetest.chat_send_player(usr,"Square")
		elseif mode == "5" then
			mode = "1"
			minetest.chat_send_player(usr,"Chisel 4 Edges")
		end
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535 / (USES - 1))
	end
	return itemstack
	end
})
minetest.register_craft({
		output = "mychisel:chisel",
		recipe = {
			{"default:steel_ingot"},
			{"wool:brown"},
		},
})
