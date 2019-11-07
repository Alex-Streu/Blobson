/// @description Click event

// Inherit the parent event
event_inherited();

var test = ds_map_create();
ds_map_add_list(test, field.name, field.setting);
show_debug_message(json_encode(test))

//Get config
var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _configs = _profile[? "Configs"];
var _config = ds_list_find_value(_configs, owner.config[? "Index"]);
var _settings = ds_map_create();
ds_map_copy(_settings, _config[? "Settings"]);

//Update config setting
ds_map_delete(_settings, field.name);
ds_map_add_list(_settings, field.name, field.setting);
ds_map_copy(_config[? "Settings"], _settings);

//Save
save_profiles();

with (owner) 
{ 
	load_player_config(_config);
	update_slot_menu();
}