/// @description Click event

// Inherit the parent event
event_inherited();

var _package = ds_map_create();
_package[? "Name"] = name;
var _list = ds_list_create();
ds_list_copy(_list, setting);
ds_map_add_list(_package, "Setting", _list);

with (owner)
{
	manageData = _package;
	update_slot_menu(obj_menu_slot_config_input);
}