///@func create_player_cursor(sprite, x, y)
///@param sprite
///@param x
///@param y
///@desc Creates a cursor

var _sprite = argument[0];
var _x = argument[1];
var _y = argument[2];

var _item = instance_create_layer(_x, _y, "CursorLayer", obj_cursor);

with (_item)
{
	sprite_index = _sprite;
	x = _x;
	y = _y;
}