/// @description Click event

// Inherit the parent event
event_inherited();

var _package = ds_map_create();
_package[? "Name"] = name;
_package[? "Setting"] = setting;

with (owner)
{
	manageData = _package;
	update_slot_menu(obj_menu_slot_config_input);
}