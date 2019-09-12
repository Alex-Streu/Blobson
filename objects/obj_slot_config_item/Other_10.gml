/// @description Click event

// Inherit the parent event
event_inherited();

var _val = config;
with (owner)
{
	load_player_config(_val);
	update_slot_menu();
}