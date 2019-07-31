///@func reset_hitbox_groups(collided_list)
///@param collided_list
//Loops through all lists and clears them
var _list;
for(var i = 0; i < ds_list_size(argument0); i++)
	{
	_list = argument0[| i];
	ds_list_clear(_list);
	}
_list = -1;