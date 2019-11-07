/// @description X Click event

// Inherit the parent event
event_inherited();

var _val = config;
with (owner)
{
	holdingComplete = true;
	load_player_config(_val);
	update_slot_menu(obj_menu_slot_config_settings);
}