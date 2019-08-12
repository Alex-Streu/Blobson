///@func ds_list_value_to_end(id, value)
///@param id
///@param value
///@desc Finds the value in the list and moves it to the back
var _id = argument[0],
	_value = argument[1];

ds_list_delete(_id, ds_list_find_index(_id, _value));
ds_list_add(_id, _value);