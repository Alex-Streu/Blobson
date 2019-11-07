///Sets up the game state
show_debug_overlay(debug);		
randomize();

//Load base font		
global.base_font = font_add_sprite(spr_base_font, ord("!"), true, 2);	

//Global check if players should be loaded
global.load_players = false;

//Global list of profiles		
global.profiles = ds_list_create();

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

#region Create button map

var key = [];
key[0]=gp_face1;
key[1]=gp_face2;
key[2]=gp_face3;
key[3]=gp_face4;
key[4]=gp_shoulderl;
key[5]=gp_shoulderr;
key[6]=gp_shoulderlb;
key[7]=gp_shoulderrb;
key[8]=gp_start;
key[9]=gp_select;
key[10]=gp_padu;
key[11]=gp_padd;
key[12]=gp_padl;
key[13]=gp_padr;
key[14]=gp_stickl;
key[15]=gp_stickr;
global.button_map = key;

#endregion


#region Create default profile and config

var _settings = ds_map_create();
_settings[? "TapJump"] = false;
_settings[? "Rumble"] = true;
_settings[? "HSensitivity"] = 0.7;
_settings[? "VSensitivity"] = 0.55;
_settings[? "RunSensitivity"] = 0.15;
_settings[? "RStickSensitivity"] = 0.25;

var _list = ds_list_create();
_list = ds_list_create(); ds_list_add(_list, gp_face1); ds_map_add_list(_settings, "Attack", _list);
_list = ds_list_create(); ds_list_add(_list, gp_face2); ds_map_add_list(_settings, "Special", _list);
_list = ds_list_create(); ds_list_add(_list, gp_face3); ds_list_add(_list, gp_face4); ds_map_add_list(_settings, "Jump", _list);
_list = ds_list_create(); ds_list_add(_list, gp_shoulderr); ds_list_add(_list, gp_shoulderl); ds_map_add_list(_settings, "Grab", _list);
_list = ds_list_create(); ds_list_add(_list, gp_shoulderrb); ds_list_add(_list, gp_shoulderlb); ds_map_add_list(_settings, "Parry", _list);
_list = ds_list_create(); ds_list_add(_list, gp_padd); ds_map_add_list(_settings, "Taunt", _list);
_list = ds_list_create(); ds_list_add(_list, gp_padl); ds_map_add_list(_settings, "TeamLeft", _list);
_list = ds_list_create(); ds_list_add(_list, gp_padr); ds_map_add_list(_settings, "TeamRight", _list);
_list = ds_list_create(); ds_list_add(_list, gp_padu); ds_map_add_list(_settings, "TeamJump", _list);
_list =  ds_list_create(); ds_list_add(_list, gp_select); ds_map_add_list(_settings, "TagIn", _list);

var _config = ds_map_create();
_config[? "ID"] = 0;
_config[? "Name"] = "DEF";
_config[? "IsDefault"] = true;
_config[? "Index"] = 0;
ds_map_add_map(_config, "Settings", _settings);
global.default_config = _config;
	
var _configs = ds_list_create();
_configs[| 0] = ds_map_create();
ds_map_copy(_configs[| 0], global.default_config);
global.default_config_list = _configs;
ds_list_mark_as_map(global.default_config_list, 0);
	
	
var _default = ds_map_create();
_default[? "ID"] = 0;
_default[? "Name"] = "DEFAULT";
_default[? "IsDefault"] = true;
_default[? "Index"] = 0;
ds_map_add_list(_default, "Configs", global.default_config_list);

ds_list_add(global.profiles, _default);
ds_list_mark_as_map(global.profiles, 0);

#endregion