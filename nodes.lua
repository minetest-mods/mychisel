-- TODO: Combine with the table in chisel.lua
local chisel_node_defs = {
	["mychisel:chiseled_%s"] = {
		desc = "",
		{ -- 1
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.4375, -0.4375, -0.5, 0.4375, 0.4375, 0.5},
		},
		{ -- 2
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{-0.375, -0.375, -0.5, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.5},
		},
		{ -- 3
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{-0.375, -0.375, -0.4375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.375, 0.4375, 0.4375, 0.5},
			{-0.3125, -0.3125, -0.5, 0.3125, 0.3125, 0.5},
		},
		{ -- 4
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.5},
			{-0.4375, -0.4375, -0.3125, 0.4375, 0.4375, 0.5},
			{-0.3125, -0.3125, -0.4375, 0.3125, 0.3125, 0.5},
			{-0.25, -0.25, -0.5, 0.25, 0.25, 0.5},
		},
	},
	["mychisel:horizontal_%s"] = {
		desc = "",
		{ -- 1
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
		},
		{ -- 2
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
		},
		{ -- 3
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
		},
		{ -- 4
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
		},
	},
	["mychisel:vertical_%s"] = {
		desc = "Vertical",
		{ -- 1
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5},
		},
		{ -- 2
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5},
		},
		{ -- 3
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5},
		},
		{ -- 4
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, 0.5, 0.5},
		},
	},
	["mychisel:cross_%s"] = {
		desc = "",
		{ -- 1
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5},
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		},
		{ -- 2
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5},
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		},
		{ -- 3
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5},
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		},
		{ -- 4
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{0.1875, -0.5, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, -0.5, -0.1875, -0.1875, 0.5},
			{-0.5, 0.1875, -0.5, -0.1875, 0.5, 0.5},
			{0.1875, 0.1875, -0.5, 0.5, 0.5, 0.5},
		},
	},
	["mychisel:square_%s"] = {
		desc = "",
		{ -- 1
			{-0.5, -0.5, -0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.4375},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.4375},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.4375},
		},
		{ -- 2
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.375},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.375},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.375},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.375},
		},
		{ -- 3
			{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.3125},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.3125},
		},
		{ -- 4
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.25},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.25},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, -0.25},
			{-0.5, 0.3125, -0.5, 0.5, 0.5, -0.25},
		},
	},
}


local default_material = {
	{"default:cobble", "default_cobble", "Cobble", {cracky = 3}},
	{"default:sandstone","default_sandstone", "Sandstone", {crumbly=2}},
	{"default:clay","default_clay",  "Clay", {crumbly=3}},
	{"default:coalblock","default_coal_block",  "Coal Block", {cracky = 3}},
	{"default:stone","default_stone", "Stone", {cracky = 3}},
	{"default:desert_stone","default_desert_stone", "Desert Stone", {cracky = 3}},
	{"default:wood","default_wood", "Wood", {choppy=2}},
	{"default:acacia_wood","default_acacia_wood", "Acacia Wood", {choppy=2}},
	{"default:aspen_wood","default_aspen_wood", "Aspen Wood", {choppy=2}},
	{"default:pine_wood","default_pine_wood", "Pine Wood", {choppy=2}},
	{"default:desert_cobble","default_desert_cobble", "Desert Cobble", {cracky = 3}},
	{"default:junglewood","default_junglewood", "Jungle Wood", {choppy=2}},
	{"default:sandstonebrick","default_sandstone_brick", "Sandstone Brick", {cracky = 2}},
	{"default:stonebrick","default_stone_brick", "Stone Brick", {cracky = 2}},
	{"default:desert_stonebrick","default_desert_stone_brick", "Desert Stone Brick", {cracky = 2}},
	{"default:steelblock", "default_steel_block", "Steel Block", {cracky = 2}},
	{"default:copperblock", "default_copper_block", "Copper Block", {cracky = 2}},
	{"default:bronzeblock", "default_bronze_block", "Bronze Block", {cracky = 2}},
	{"default:goldblock", "default_gold_block", "Gold Block", {cracky = 2}},
	{"default:tinblock", "default_tin_block", "Tin Block", {cracky = 2}},
	{"moreblocks:copperpatina", "moreblocks_copperpatina", "Copperpatina", {cracky = 2}},
	{"default:desert_sandstone","default_desert_sandstone", "Desert Sandstone", {cracky = 2}},
	{"default:desert_sandstone_brick","default_desert_sandstone_brick", "Desert Sandstonebrick", {cracky = 2}},
	{"default:silver_sandstone","default_silver_sandstone", "Silver Sandstone", {cracky = 2}},
	{"default:silver_sandstone_brick","default_silver_sandstone_brick", "Silver Sandstonebrick", {cracky = 2}},
}


if minetest.get_modpath( "bakedclay") then
	local clay = {
		{"white", "White"},
		{"grey", "Grey"},
		{"black", "Black"},
		{"red", "Red"},
		{"yellow", "Yellow"},
		{"green", "Green"},
		{"cyan", "Cyan"},
		{"blue", "Blue"},
		{"magenta", "Magenta"},
		{"orange", "Orange"},
		{"violet", "Violet"},
		{"brown", "Brown"},
		{"pink", "Pink"},
		{"dark_grey", "Dark Grey"},
		{"dark_green", "Dark Green"},
		{"natural", "Natural"}
	}

	for _, clay in pairs(clay) do
		table.insert(default_material,{"bakedclay:"..clay[1] , "baked_clay_" .. clay[1], clay[2] .. " Baked Clay",{cracky = 2}})
	end
end


for _, material in ipairs(default_material) do
	local item   = material[1]
	local mat    = material[2]
	local desc   = material[3]
	local groups = material[4]
	groups.not_in_creative_inventory = 1

	for name, def in pairs(chisel_node_defs) do
		if not minetest.registered_nodes[item] then
			minetest.log("warning", "[mychisel] Tried to register node '" .. item ..
				"' but it does not exist.")
			break
		end

		local n = 1
		while def[n] do
			local box = {
				type = "fixed",
				fixed = def[n]
			}
			minetest.register_node(name:format(mat .. n), {
				description = def.desc .. " " .. desc .. n,
				drawtype = "nodebox",
				tiles = {
					mat..".png",
					mat..".png",
					mat..".png",
					mat..".png",
					mat..".png",
					mat..".png^mychisel_vtint.png",
				},
				paramtype = "light",
				paramtype2 = "facedir",
				drop = item,
				groups = groups,
				node_box = box,
				selection_box = box,
				on_place = minetest.rotate_node,
			})
			n = n + 1
		end
	end
end
