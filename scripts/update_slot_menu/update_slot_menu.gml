///@func update_slot_menu(menu)
///@param menu

var _menu = argument_count > 0 ? argument[0] : noone;

if (_menu == noone)
{
	ds_stack_pop(menuStack);
	_menu = ds_stack_top(menuStack);
}
else { ds_stack_push(menuStack, _menu); }

if (instance_exists(menu)) { instance_destroy(menu); }
menu = instance_create_layer(0, 0, "MenuLayer", _menu);
menu.owner = id;