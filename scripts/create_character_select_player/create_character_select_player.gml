///@func create_character_select_player(name, color, portrait, x, y)
///@param name
///@param color
///@param x
///@param y
///@desc Creates a character select player

var _name = argument[0];
var _color = argument[1];
var _portrait = argument[2];
var _x = argument[3];
var _y = argument[4];

var _item = instance_create_layer(_x, _y, "IconsLayer", obj_character_select_player);

with (_item) {
	name = _name;
	bg_color = _color;
	portrait = _portrait;
}

return _item;