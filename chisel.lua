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




local wehavetechnic =  minetest.get_modpath("technic")


  
  

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

			-- Chatcommand to show loaded mods with names and number of styles 
			
minetest.register_chatcommand("chisel", {
	params = "",
	description = "Shows supported mods in mychisel",
	privs = {interact = true},
	func = function(name, poi_name)

		for i in ipairs (chisel.mods) do 
		  
		      minetest.chat_send_player(name,core.colorize(color,i..") modname :"..chisel.mods[i][1].."   styles: "..chisel.mods[i][2]))
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
  	minetest.add_particlespawner(25, 0.3,
		pos, pos,
		{x=2, y=0.2, z=2}, {x=-2, y=2, z=-2},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.2, 1,
		0.2, 2,
		true, "mychisel_parti.png")
end




local function chiselcut(pos,user,node)
           local name = user:get_player_name()
	   
	   for i in ipairs (chisel.materials) do
	     
	     if chisel.materials[i][1] == chisel.active[name] then	     
	      if node.name == chisel.materials[i][3] and chisel.materials[i][4] == chisel.materials[chisel.program[name]][4] then
		
		minetest.set_node(pos, {name=chisel.materials[i][1]..":"..chisel.materials[i][2].."_"..chisel.materials[i][4], param2=minetest.dir_to_facedir(user:get_look_dir())})
	      end
	     end
	   end
end


local function change_mode(user, choice)
      
		local name = user:get_player_name()
		

		if choice then
			if chisel.mode[name] == "1" then
				chisel.mode[name] = "2"
				minetest.chat_send_player(name,core.colorize(color, "Horizontal Groove"))

			elseif chisel.mode[name] == "2" then
				chisel.mode[name] = "3"
				minetest.chat_send_player(name,core.colorize(color, "Vertical Groove"))

			elseif chisel.mode[name] == "3" then
				chisel.mode[name] = "4"
				minetest.chat_send_player(name, core.colorize(color, "Cross Grooves"))

			elseif chisel.mode[name] == "4" then
				chisel.mode[name] = "5"
				minetest.chat_send_player(name, core.colorize(color, "Square"))

			elseif chisel.mode[name] == "5" then
				chisel.mode[name] = "1"
				minetest.chat_send_player(name, core.colorize(color, "Chisel 4 Edges"))
			end
		else
			chisel.program[name] = chisel.program[name] +1
			if chisel.program[name] > chisel.mods [chisel.selected[name]][2] then chisel.program[name] = 1 end
			minetest.chat_send_player(name, core.colorize(color, chisel.materials [chisel.program[name]][4]))
		end
			
end


      

local function chiselme(pos, user, node)
  
  
		local name = user:get_player_name()
		
		
  
		for i in ipairs (default_material) do
		local item = default_material [i][1]
		local mat = default_material [i][2]
		local desc = default_material [i][3]
		

		if chisel.mode[name] == "1" then

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

		if chisel.mode[name] == "2" then

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

		if chisel.mode[name] == "3" then

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

		if chisel.mode[name] == "4" then

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

		if chisel.mode[name] == "5" then

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
	
end

    
if not wehavetechnic then

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
		      local feedback = false
		      local name = user:get_player_name()
		      
		      
		      
		      
		      if minetest.is_protected(pos, user:get_player_name()) then
			      minetest.record_protection_violation(pos, user:get_player_name())
			      return
		      end

		      
		      if chisel.active[name] == "default" then
			    chiselme(pos,user,node)
			    
		      else
			    
			    chiselcut(pos,user,node)
			    
		      end


		      if not minetest.setting_getbool("creative_mode") then
			      itemstack:add_wear(65535 / (USES - 1))
		      end

		      return itemstack

	      end,

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
		      if( not( keys["sneak"] )) then
			   if chisel.active[name] == "default" then 
				change_mode(user,true)
			   else
			       
				change_mode(user,false)
			     
			   end 
		      else
			  chisel.selected[name] = chisel.selected[name] +1
			  if chisel.selected[name] > chisel.count_mods() then chisel.selected[name] = 1 end
			  
			  chisel.active[name] = chisel.mods[chisel.selected[name]][1]
			  minetest.chat_send_player(user:get_player_name(), core.colorize(color, " ***>>> switched to mod: "..chisel.active[name]))
			  
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

      
      
      
      else


	  local S = technic.getter

	  technic.register_power_tool("mychisel:chisel",TechnicMaxCharge)
	  local chisel_charge_per_node =math.floor( TechnicMaxCharge / USES )


	  minetest.register_tool("mychisel:chisel", {
		  description = S("Chisel"),
		  inventory_image = "mychisel_chisel.png",
		  stack_max = 1,
		  wear_represents = "technic_RE_charge",
		  on_refill = technic.refill_RE_charge,
		  on_use = function(itemstack, user, pointed_thing)
		    
			  
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

		      --
		      
		      local meta = minetest.deserialize(itemstack:get_metadata())
			  if not meta or not meta.charge or
					  meta.charge < chisel_charge_per_node then
				  return
			  end
		      
		      if chisel.active[name] == "default" then
			    chiselme(pos,user,node)
			    meta.charge = meta.charge - chisel_charge_per_node
		      else
			    
			    chiselcut(pos,user,node)
			    meta.charge = meta.charge - chisel_charge_per_node
		      end

			  

			  if not technic.creative_mode then
				  technic.set_RE_wear(itemstack, meta.charge, TechnicMaxCharge)
				  itemstack:set_metadata(minetest.serialize(meta))
			  end
			  
			  return itemstack
		    
			  
		  end,
		  
		  on_place = function(itemstack, user, pointed_thing)

		      local number = chisel.count_mods()
		      local keys = user:get_player_control()
		      local name = user:get_player_name()
		      
		      
	
		      -- change design mode of chisel by pressing sneak while right-clicking
		      if( not( keys["sneak"] )) then
			   if chisel.active[name] == "default" then 
				change_mode(user,true)
			   else
			       
				change_mode(user,false)
			     
			   end 
		      else
			  chisel.selected[name] = chisel.selected[name] +1
			  if chisel.selected[name] > chisel.count_mods() then chisel.selected[name] = 1 end
			  
			  chisel.active[name] = chisel.mods[chisel.selected[name]][1]
			  minetest.chat_send_player(user:get_player_name(),core.colorize(color, " ***>>> switched to mod: "..chisel.active[name]))
			  
		      end

		      return itemstack

	      end
	  })


	  minetest.register_craft({
			    output = "mychisel:chisel",
			    recipe = {
				    {"default:diamond",                                  "default:diamond" ,                      "default:diamond"              },
				    {"",      "technic:stainless_steel_ingot",              ""},
				    {"",                              "technic:battery",                                 ""},
			    }
		    })
	  
	  
	
end

chisel.add_mod("default",5)