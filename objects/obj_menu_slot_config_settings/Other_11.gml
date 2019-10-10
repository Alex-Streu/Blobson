/// @description Update config settings

var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _configs = _profile[? "Configs"];
var _config = ds_list_find_value(_configs, owner.config[? "Index"]);
var _settings = _config[? "Settings"];
with (obj_slot_config_setting)
{
	_settings[? name] = setting;
}

with (owner) 
{ 
	load_player_config(_config);
}

// Inherit the parent event
event_inherited();