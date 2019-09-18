/// @description Click event

// Inherit the parent event
event_inherited();

ds_map_copy(owner.config, global.default_config);

with (obj_slot_config_setting)
{
	setting = owner.config[? name];
}