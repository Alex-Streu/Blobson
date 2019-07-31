///Sets up the game state
show_debug_overlay(debug);

//Global list for collision checking
global.col_list = ds_list_create();

//Global particle system
global.part_sys = part_system_create();

//Global array for player device numbers (controller)
global.device_number = array_create(max_players, -1);

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