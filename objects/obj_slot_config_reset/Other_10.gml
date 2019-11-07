/// @description Click event

// Inherit the parent event
event_inherited();

ds_map_copy(owner.config[? "Settings"], global.default_config[? "Settings"]);
var _settings = owner.config[? "Settings"];

with (obj_slot_config_setting)
{
	setting = _settings[? name];
}

save_profiles();