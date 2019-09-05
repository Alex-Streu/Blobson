/// @description Click event

// Inherit the parent event
event_inherited();

var _val = profile;
with (owner)
{
	load_player_profile(_val[? "ID"]);
	update_slot_menu();
}