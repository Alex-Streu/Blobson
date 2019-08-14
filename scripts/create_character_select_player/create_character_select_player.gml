///@func create_character_select_player(player, name, color, isActive, x, y, marker)
///@param player
///@param name
///@param color
///@param isActive
///@param x
///@param y
///@param marker
///@desc Creates a character select player

var _player = argument[0];
var _name = argument[1];
var _color = argument[2];
var _isActive = argument[3];
var _x = argument[4];
var _y = argument[5];
var _marker = argument[6];

var _item = instance_create_layer(_x, _y, "MarkerLayer", obj_character_select_player);

with (_item) {
	player = _player;
	name = _name;
	bg_color = _color;
	isActive = _isActive;
	marker = _marker;
}

return _item;