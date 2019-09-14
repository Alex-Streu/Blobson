/// @description Update config settings

var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _configs = _profile[? "Configs"];
var _config = ds_list_find_value(_configs, owner.config[? "Index"]);
with (obj_slot_config_setting)
{
	_config[? name] = setting;
}

//save_profiles();

with (owner) 
{ 
	load_player_config(_config);
}

// Inherit the parent event
event_inherited();