/// @description Click event

// Inherit the parent event
event_inherited();

owner.config = global.default_config;

var _config = owner.config;
with (obj_slot_config_setting)
{
	setting = _config[? name];
}