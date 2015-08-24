local default_material = {
		{"default:cobble", "default_cobble", "Cobble"},
		{"default:sandstone","default_sandstone", "Sandstone"},
		{"default:clay","default_clay",  "Clay"},
		{"default:stone","default_stone", "Stone"},
		{"default:desert_stone","default_desert_stone", "Desert Stone"},
		{"default:wood","default_wood", "Wood"},
		{"default:pinewood","default_pinewood", "Pine Wood"},
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


minetest.register_node("mychisel:chiseled_"..mat.."1", {
	description = "Chiseled"..desc.."1",
	drawtype = "nodebox",
	tiles = {mat..".png"
		},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = item,
	groups = {cracky = 2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.4375, -0.4375, -0.5, 0.4375, 0.4375, 0.5},  
			}
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.4375, -0.4375, -0.5, 0.4375, 0.4375, 0.5},
		}
	}

})
minetest.register_node("mychisel:chiseled_"..mat.."2", {
	description = "Chiseled"..desc.."2",
	drawtype = "nodebox",
	tiles = {mat..".png"
		},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = item,
	groups = {cracky = 2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.5, 0.375, 0.375, 0.5}, 
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.5}, 
			}
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.5, 0.375, 0.375, 0.5}, 
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.5}, 
		}
	}

})
minetest.register_node("mychisel:chiseled_"..mat.."3", {
	description = "Chiseled"..desc.."3",
	drawtype = "nodebox",
	tiles = {mat..".png"
		},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = item,
	groups = {cracky = 2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.4375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.375, 0.4375, 0.4375, 0.5},
			{-0.3125, -0.3125, -0.5, 0.3125, 0.3125, 0.5},
			}
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.4375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.375, 0.4375, 0.4375, 0.5},
			{-0.3125, -0.3125, -0.5, 0.3125, 0.3125, 0.5}, 
		}
	}

})
minetest.register_node("mychisel:chiseled_"..mat.."4", {
	description = "Chiseled"..desc.."4",
	drawtype = "nodebox",
	tiles = {mat..".png"
		},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = item,
	groups = {cracky = 2, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.3125, 0.4375, 0.4375, 0.5}, 
			{-0.3125, -0.3125, -0.4375, 0.3125, 0.3125, 0.5}, 
			{-0.25, -0.25, -0.5, 0.25, 0.25, 0.5}, 
			}
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}, 
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.3125, 0.4375, 0.4375, 0.5}, 
			{-0.3125, -0.3125, -0.4375, 0.3125, 0.3125, 0.5}, 
			{-0.25, -0.25, -0.5, 0.25, 0.25, 0.5},  
		}
	}

})
end
