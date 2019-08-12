///Sets up the game state
show_debug_overlay(debug);
randomize();

//Global list for collision checking
global.col_list = ds_list_create();

//Global particle system
global.part_sys = part_system_create();

//Global array for player device numbers (controller)
global.device_number = array_create(max_players, -1);

//Player data for the win screen (temporary)
global.win_screen_data_temp = -1;

//Replay mode
global.replay_mode = false;
global.replay_record = true;
global.replay_data = ds_map_create();
global.game_replay = ds_list_create();

//Add in a buffer for each player
for(var i = 0; i < max_players; i++)
	{
	var _buffer = buffer_create(1, buffer_grow, 1);
	ds_list_add(global.game_replay, _buffer);
	}
	
ds_map_add_list(global.replay_data, "DATA", global.game_replay);
global.replay_data[? "SEED"] = random_get_seed();
global.replay_data[? "TIME"] = Timestamp_Create();

//Particles
Part_System_Init();

//Game resizing
surface_resize(application_surface,camera_width,camera_height);
window_set_size(camera_width,camera_height);
window_set_position
	(
	display_get_width() div 2 - camera_width div 2,
	display_get_height() div 2 - camera_height div 2
	);
	
//Game camera
view_enabled[0] = true;
view_visible[0] = true;
view_wport[0] = camera_width;
view_hport[0] = camera_height;
global.game_cam = camera_create_view(0, 0, camera_width, camera_height);
view_camera[0] = global.game_cam;