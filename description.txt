A chisel that allows you to shape blocks. 
If technic mod is present the chisel will be rechargeable.

To craft a chisel just put a steel ingot and a brown wool in the crafting grid. The steel goes above the wool.
(different recipe for technic device)

Once you have your chisel you can set the style by right clicking. 

There are 5 styles to choose from(default)
- horizontal groove
- vertical groove
- cross groves (this matches up with the vertical and horizontal grooves
- square
- 4 edges

Right click until you see the style you want in the chat then point at the node and left click.
Each node can be cut 4 times. Each time you chisel the groove will get a little deeper.

Shift right click to change the supported mod. Here the list of supported mods:
default (mychisel mod) 	5 styles
facade			10 styles

Only certain nodes can be chiseled. Here are the supported nodes


	Cobble
	Sandstone
	Clay
	Coal Block
	Stone
	Desert Stone"
	Wood
	Acacia Wood
	Aspen Wood
	Pine Wood
	Desert Cobble
	Jungle Wood
	Sandstone Brick
	Stone Brick
	Desert Stone Brick

Forum - https://forum.minetest.net/viewtopic.php?f=11&t=13104



*************************************************************************
*************************************************************************
*** added 01/2018 by Gundul                                           ***
*** chiselapi:                                                        ***
*************************************************************************
*************************************************************************

Fist init your mod with mychisel:
  
	  chisel.add_mod(modname,number)
	  
	  modname = the name of your mod
	  number  = number of different styles for each node
	  
	  
  Then register your nodes with mychisel:
  
	  chisel.register_node(modname, prefix, raw, design)
	  
	  modname = the name of your node
	  prefix  = prefix of your new node name right behind the ":", usually the name of the raw material without "modname:"
	  raw     = name of the raw material for example "default:stone"
	  design  = name of your nodestyle after beeing chiseled
	  

  Naming your nodes:
  
	In your mod the nodes should be named like this: modname..":"..prefix.."_"..design
	
	
	
  depends.txt:
  
      In your modfolder add this line to your depends.txt: mychisel?
      
      
	
	  
	  
	  Example:  you made a mod named "pillar" with 3 different pillar designs
	  
		  first register your mod: chisel.add_mod(pillar,3)
		  
		  
		  then register each node of it:

		  chisel.register_node("pillar", "stone", "default:stone", "round")
		  chisel.register_node("pillar", "stone", "default:stone", "square")
		  chisel.register_node("pillar", "stone", "default:stone", "hexagon")
		  
		  
		  Do this for every material your mod supports:
		  
		  chisel.register_node("pillar", "sandstone", "default:sandstone", "round")
		  chisel.register_node("pillar", "sandstone", "default:sandstone", "square")
		  chisel.register_node("pillar", "sandstone", "default:sandstone", "hexagon")
		  ...
		  
		  
		  In your mod the nodes should have names like:
		  
				pillar:stone_round
				pillar:stone_square
				pillar:stone_hexagon
				pillar:sandstone_round
				...
				
				
				