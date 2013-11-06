-------------------------------------------------------------------------------
-- Rabbit for Minetest
-- Model and texture by AspireMint
-- based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: animal_rabbit loading ...")

local version = "0.0.1"

local selectionbox_rabbit = {-0.2, -0.0625, -0.2, 0.2, 0.125, 0.2}

local rabbit_groups = {
						not_in_creative_inventory=1
					}

snow_rabbit_prototype = {
		name="snow_rabbit", 
		modname="mobf_rabbit",

		factions = {
			member = {
				"animals",
				}
		},

	
		generic = {
					description="Snow rabbit (Animals)",
					base_health=2,
					kill_result="animalmaterials:fur 1",
					armor_groups= {
						fleshy=90,
					},
					groups = rabbit_groups,
					envid="on_ground_1",
				},
		movement =  {
					default_gen="probab_mov_gen",
					min_accel=0.4,
					max_accel=0.6,
					max_speed=1.0,
					pattern="run_and_jump_low",
					canfly=false,
--					guardspawnpoint = true,
					},
		catching = {
					tool="animalmaterials:net",
					consumed=true,
					},
--		attention = {
--					hear_distance = 5,
--					hear_distance_value = 20,
--					view_angle = math.pi/2,
--					own_view_value = 0.2,
--					remote_view = false,
--					remote_view_value = 0,
--					attention_distance_value = 0.2,
--					watch_threshold = 10,
--					attack_threshold = 20,
--					attention_distance = 10,
--					attention_max = 25,
--		},

		spawning = {
					primary_algorithms = {
						{
						rate=0.02,
						density=250,
						algorithm="forrest_mapgen",
						height=1
						},
						{
						rate=0.01,
						density=250,
						algorithm="shadows_spawner",
						height=1,
						respawndelay = 120,
						},
					},
					secondary_algorithms = {
						{
						rate=0.002,
						density=250,
						algorithm="forrest",
						height=2
						},
						{
						rate=0.002,
						density=250,
						algorithm="shadows",
						height=2
						},
					}
				},
		animation = {
				walk = { -- running
					start_frame = 40,
					end_frame   = 60,
					basevelocity = 0.1,
					},
				stand = {   -- hidden
					start_frame = 0,
					end_frame   = 30,
					},
				guard = { -- on duty
					start_frame = 70,
					end_frame   = 130,
				}
			},
		states = {
				{ 
				name = "default",
				movgen = "none",
				chance = 0,
				animation = "stand",
				graphics_3d = {
					visual = "mesh",
					mesh = "NEW_rabbit_snow.x",
					textures = {"rabbit_grey.png"},
					collisionbox = selectionbox_rabbit,
					visual_size= {x=1,y=1,z=1},
					},
				graphics = {
					sprite_scale={x=1,y=1},
					sprite_div = {x=6,y=1},
					visible_height = 1,
					visible_width = 1,
					},	
				typical_state_time = 10,
				},
				{ 
					name = "walking",
					movgen = "probab_mov_gen",
					chance = 0.30,
					animation = "walk",
					typical_state_time = 100,
				},
				{
					name = "hiding",
					movgen = "none",
					chance = 0.50,
					animation = "stand",
                                        typical_state_time = 200,
				},
				{
					name = "guarding",
					movgen = "none",
					chance = 0.25,
					animation = "guard",
                                        typical_state_time = 30,
				}

			},
		}



--register mod
minetest.log("action","\tadding "..snow_rabbit_prototype.name)
mobf_add_mob(snow_rabbit_prototype)
minetest.log("action","MOD: mobf_rabbit mod             version " .. version .. " loaded")
