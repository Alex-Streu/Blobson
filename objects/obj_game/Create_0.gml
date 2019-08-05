/// @description Initialize
//Gives each player a controller (must be created after the players)
Assign_Controllers();

//Load controls for each player
Assign_Custom_Controls();

//Set the state
state = GAME_STATE.startup;

//Camera
view_enabled[0] = true;
view_visible[0] = true;
view_wport[0] = camera_width;
view_hport[0] = camera_height;
cam = global.game_cam; //camera_create_view(0, 0, camera_width, camera_height);
view_camera[0] = cam;
cam_x = 0;
cam_y = 0;
cam_x_goal = 0;
cam_y_goal = 0;
cam_shake_h = 0;
cam_shake_v = 0;
cam_w = camera_width;
cam_h = camera_height;
cam_w_goal = cam_w;
cam_h_goal = cam_h;

//Center the camera on the players
Camera_Average();
cam_x = cam_x_goal;
cam_y = cam_y_goal;
camera_set_view_pos(cam, cam_x, cam_y);

//Game surface
game_surface = surface_create(room_width, room_height);
game_buff = buffer_create(0, buffer_grow, 1);
buffer_get_surface(game_buff, game_surface, 0, 0, 0);
buffer_resize(game_buff, buffer_tell(game_buff));

//Set up the hitbox priority queue
hitbox_priority_queue = ds_priority_create();

//Frame advance
current_frame = 0;
frames_advanced = 0;
draw = true;

//Cache some values
number_of_players = instance_number(obj_player);
status_bar_space =  64 + (camera_width div (number_of_players + 1));
player_status_x = -300;
player_status_y = (camera_height - player_status_padding_bottom - 64);

//Shader uniforms
uni_s = shader_get_uniform(shd_palette, "sample");
uni_r = shader_get_uniform(shd_palette, "replace");

if (day_night_cycle_enable)
	{
	uni_red = shader_get_uniform(shd_daynight, "red");
	uni_blue = shader_get_uniform(shd_daynight, "blue");
	uni_green = shader_get_uniform(shd_daynight, "green");
	}

//Startup counter
countdown = 240;

//portrait palettes

//player_1_pal = 3;
//player_3_pal = 4;
//player_2_pal = 5;
current_pal = 1;

var _player = instance_find(obj_player, instance_number(obj_player)-1);	

//if _player.player_number = 0 {current_pal = 2}
//if _player.player_number = 1 {current_pal = 3}
//if _player.player_number = 2 {current_pal = 3}

my_portrait_pal_sprite = spr_matsu_portrait_pal //fighter's portrait palette

//current_pal = 1

///Override stuff.
override_surface=noone;
override_pal_index=1;

ex_meter_ui_x = 154;
