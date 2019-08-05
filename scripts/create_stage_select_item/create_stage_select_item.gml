///@func create_stage_select_item(name, icon, room, x, y)
///@param name
///@param icon
///@param room
///@param x
///@param y
///@desc Creates a stage select item

var _name = argument[0];
var _icon = argument[1];
var _room = argument[2];
var _x = argument[3];
var _y = argument[4];

var _item = instance_create_layer(_x, _y, "IconsLayer", obj_stage_select_item);

with (_item) {
	name = _name;
	icon = _icon;
	toRoom = _room;
	iconW = sprite_get_width(icon);
	iconH = sprite_get_height(icon);
}

return _item;