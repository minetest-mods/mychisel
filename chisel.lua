local USES = 200
local color = '#FF6700'
local TechnicMaxCharge = 300000
chisel = {}

chisel.materials = {}
chisel.mods = {}
chisel.selected = {}
chisel.active = {}
chisel.program = {}
chisel.mode = {}

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
	{"default:steelblock", "default_steel_block", "Steel Block"},
	{"default:copperblock", "default_copper_block", "Copper Block"},
	{"default:bronzeblock", "default_bronze_block", "Bronze Block"},
	{"default:goldblock", "default_gold_block", "Gold Block"},
	{"default:tinblock", "default_tin_block", "Tin Block"},
	{"moreblocks:copperpatina", "moreblocks_copperpatina", "Copperpatina"},
	{"default:desert_sandstone","default_desert_sandstone", "Desert Sandstone"},
	{"default:desert_sandstone_brick","default_desert_sandstone_brick", "Desert Sandstonebrick"},
	{"default:silver_sandstone","default_silver_sandstone", "Silver Sandstone"},
	{"default:silver_sandstone_brick","default_silver_sandstone_brick", "Silver Sandstonebrick"},
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
		table.insert(default_material,{"bakedclay:"..clay[1] , "baked_clay_" .. clay[1], clay[2] .. " Baked Clay"})
	end
end

-- Chatcommand to show loaded mods with names and number of styles and supported materials
minetest.register_chatcommand("chisel", {
	params = "",
	description = "Shows supported mods and materials in mychisel",
	privs = {interact = true},
	func = function(name, poi_name)

		for i in ipairs (chisel.mods) do
			local counter = 1
			local rawname = ""

			minetest.chat_send_player(name,core.colorize(color,i..") modname: "..chisel.mods[i][1].."   styles: "..chisel.mods[i][2]))
			if chisel.mods[i][1] == "default" then
				for j in ipairs (default_material) do
					minetest.chat_send_player(name, "     "..j..": "..default_material[j][1])
				end
			else
				for j in ipairs (chisel.materials) do
					if chisel.materials[j][3] ~= rawname then
						minetest.chat_send_player(name, "     "..counter..": "..chisel.materials[j][3])
						rawname = chisel.materials[j][3]
						counter = counter +1
					end
				end
			end
		end

	end,
})

-- global API

function chisel.register_node(modname, prefix, raw, design) -- global function to register new stuff
	local counter = chisel.count_stuff() +1
	chisel.materials [counter] = {}
	chisel.materials [counter][1] = modname
	chisel.materials [counter][2] = prefix
	chisel.materials [counter][3] = raw
	chisel.materials [counter][4] = design
end


function chisel.add_mod(modname,number)                     -- global function to init a new mod for the chisel.
	local counter = chisel.count_mods() +1
	chisel.mods [counter] = {}
	chisel.mods [counter][1] = modname
	chisel.mods [counter][2] = number
	minetest.log("action","[CHISEL] Added mod "..modname .. " with " .. number.." styles to mychisel") -- log loaded mods to debug.txt
end



function chisel.count_stuff()  -- how many materials have been registered already ?
	local counter = 0
	for i in ipairs (chisel.materials) do counter = counter +1 end
	return counter
end



function chisel.count_mods()   -- how many different mods are registered ?

	local counter = 0
	for i in ipairs (chisel.mods) do counter = counter +1 end
	return counter
end




-- init chisel for each player joining

local function chiselinit(name)
	chisel.selected[name] = 1
	chisel.active[name] = "default"
	chisel.program[name] = 1
	chisel.mode[name] = "1"
end

minetest.register_on_joinplayer(function(player)
	chiselinit(player:get_player_name())
end)

-- end init

local function parti(pos)
	minetest.add_particlespawner({
		amount = 25,
		time = 0.3,
		minpos = pos,
		maxpos = pos,
		minvel = {x=2, y=0.2, z=2},
		maxvel = {x=-2, y=2, z=-2},
		minacc = {x=0, y=-6, z=0},
		maxacc = {x=0, y=-10, z=0},
		minexptime = 0.2,
		maxexptime = 1,
		minsize = 0.2,
		maxsize = 2,
		collisiondetection = true,
		texture = "mychisel_parti.png"
	})
end

local function chiselcut(pos,user,node)
	local name = user:get_player_name()

	for i in ipairs (chisel.materials) do
		local material = chisel.materials[i]

		if material[1] == chisel.active[name] then
			if node.name == material[3] and material[4] == chisel.materials[chisel.program[name]][4] then
				local stack = ItemStack(material[1]..":"..material[2].."_"..material[4])
				if not stack:is_known() then
					return false
				end

				minetest.set_node(pos, {
					name = stack:get_name(),
					param2 = minetest.dir_to_facedir(user:get_look_dir())
				})
				return true
			end
		end
	end
end

local chisel_modes = {
	["1"] = {desc = "Chisel 4 Edges",    cut = "mychisel:chiseled_%s"},
	["2"] = {desc = "Horizontal Groove", cut = "mychisel:horizontal_%s"},
	["3"] = {desc = "Vertical Groove",   cut = "mychisel:vertical_%s"},
	["4"] = {desc = "Cross Grooves",     cut = "mychisel:cross_%s"},
	["5"] = {desc = "Square",            cut = "mychisel:square_%s"}
}

local function change_mode(user, choice)
	-- choice = true:  choose next program
	-- choice = false: choose next mode
	local name = user:get_player_name()

	if not choice then
		local player_program = chisel.program[name]
		player_program = player_program + 1
		if player_program > chisel.mods[chisel.selected[name]][2] then
			player_program = 1
		end

		chisel.program[name] = player_program
		minetest.chat_send_player(name, core.colorize(color, chisel.materials[player_program][4]))
		return
	end

	local player_mode = tostring((tonumber(chisel.mode[name]) or 0) + 1)
	if not chisel_modes[player_mode] then
		player_mode = "1"
	end

	chisel.mode[name] = player_mode
	minetest.chat_send_player(name, core.colorize(color, chisel_modes[player_mode].desc))
end


local function chiselme(pos, user, node)
	local name = user:get_player_name()

	for i in ipairs (default_material) do
		local item = default_material[i][1]
		local mat = default_material[i][2]
		--local desc = default_material[i][3]
		local cmode = chisel_modes[chisel.mode[name]]
		local newnode

		if cmode then
			if node.name == item then
				newnode = cmode.cut:format(mat .. "1")
			elseif node.name == cmode.cut:format(mat .. "1") then
				newnode = cmode.cut:format(mat .. "2")
			elseif node.name == cmode.cut:format(mat .. "2") then
				newnode = cmode.cut:format(mat .. "3")
			elseif node.name == cmode.cut:format(mat .. "3") then
				newnode = cmode.cut:format(mat .. "4")
			end
		end
		if newnode then
			minetest.swap_node(pos, {
				name = newnode,
				param2 = minetest.dir_to_facedir(user:get_look_dir())
			})
			parti(pos)
		end
	end
end


local chisel_def = {
	description = "Chisel",
	inventory_image = "mychisel_chisel.png",
	wield_image = "mychisel_chisel.png",
	-- on_use is specific

	on_place = function(itemstack, user, pointed_thing)
		local number = chisel.count_mods()
		local keys = user:get_player_control()
		local name = user:get_player_name()
		local node = minetest.get_node(pointed_thing.under)

		-- chisel can be repaired with an anvil
		if node.name == "anvil:anvil" then
			minetest.item_place(itemstack, user, pointed_thing)
			return itemstack
		end

		-- change design mode of chisel by pressing sneak while right-clicking
		if not keys.sneak then
			if chisel.active[name] == "default" then
				change_mode(user,true)
			else
				change_mode(user,false)
			end
		else
			chisel.selected[name] = chisel.selected[name] + 1
			if chisel.selected[name] > chisel.count_mods() then
				chisel.selected[name] = 1
			end

			chisel.active[name] = chisel.mods[chisel.selected[name]][1]
			minetest.chat_send_player(
				user:get_player_name(),
				core.colorize(color, " ***>>> switched to mod: "..chisel.active[name])
			)
		end
		return itemstack
	end
}

if not minetest.get_modpath("technic") then
	chisel_def.on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end

		local pos = pointed_thing.under
		local node = minetest.get_node(pos)
		local name = user:get_player_name()
		local cut = false

		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return
		end

		if chisel.active[name] == "default" then
			chiselme(pos,user,node)
		else
			cut = chiselcut(pos,user,node)
		end

		if not minetest.settings:get_bool("creative_mode") and cut then
			itemstack:add_wear(65535 / (USES - 1))
		end

		return itemstack
	end

	minetest.register_tool("mychisel:chisel", chisel_def)

	minetest.register_craft({
		output = "mychisel:chisel",
		recipe = {
			{"default:steel_ingot"},
			{"wool:brown"},
		},
	})

else -- technic is installed

	local S = technic.getter
	local chisel_charge_per_node = math.floor(TechnicMaxCharge / USES)

	chisel_def.description = S("Chisel")

	if technic.plus then
		chisel_def.max_charge = TechnicMaxCharge
		chisel_def.on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			local name = user:get_player_name()

			if minetest.is_protected(pos, name) then
				minetest.record_protection_violation(pos, name)
				return
			end

			if technic.use_RE_charge(itemstack, chisel_charge_per_node) then
				if chisel.active[name] == "default" then
					chiselme(pos,user,node)
				else
					chiselcut(pos,user,node)
				end
				return itemstack
			end
		end
		technic.register_power_tool("mychisel:chisel", chisel_def)
	else
		technic.register_power_tool("mychisel:chisel",TechnicMaxCharge)

		chisel_def.wear_represents = "technic_RE_charge"
		chisel_def.on_refill = technic.refill_RE_charge
		chisel_def.on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			local name = user:get_player_name()

			if minetest.is_protected(pos, user:get_player_name()) then
				minetest.record_protection_violation(pos, user:get_player_name())
				return
			end

			local meta = minetest.deserialize(itemstack:get_metadata())
			if not meta or not meta.charge or
					meta.charge < chisel_charge_per_node then
				return
			end

			if chisel.active[name] == "default" then
				chiselme(pos,user,node)
			else
				chiselcut(pos,user,node)
			end
			meta.charge = meta.charge - chisel_charge_per_node

			if not technic.creative_mode then
				technic.set_RE_wear(itemstack, meta.charge, TechnicMaxCharge)
				itemstack:set_metadata(minetest.serialize(meta))
			end

			return itemstack
		end,

		minetest.register_tool("mychisel:chisel", chisel_def)
	end

	minetest.register_craft({
		output = "mychisel:chisel",
		recipe = {
			{"default:diamond", "default:diamond" ,              "default:diamond"},
			{"",                "technic:stainless_steel_ingot", ""},
			{"",                "technic:battery",               ""},
		}
	})
end

chisel.add_mod("default",5)
