///@func update_slot_menu(menu)
///@param menu

var _menu = argument_count > 0 ? argument[0] : noone;
var _pageIndex = 0;

if (_menu == noone)
{
	ds_stack_pop(menuStack);
	ds_stack_pop(pageIndexStack);
	_menu = ds_stack_top(menuStack);
	_pageIndex = ds_stack_top(pageIndexStack);
}
else 
{ 
	if (menu != noone)
	{
		ds_stack_pop(pageIndexStack);
		ds_stack_push(pageIndexStack, menu.pageIndex);
	}
	ds_stack_push(pageIndexStack, _pageIndex);
	ds_stack_push(menuStack, _menu); 
}

if (instance_exists(menu)) { instance_destroy(menu); }
menu = instance_create_layer(0, 0, "MenuLayer", _menu);
menu.owner = id;
menu.pageIndex = _pageIndex;