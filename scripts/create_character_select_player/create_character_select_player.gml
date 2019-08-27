///@func create_character_select_player(player, name, color, isActive, marker, sprite)
///@param player
///@param name
///@param color
///@param isActive
///@param marker
///@param sprite
///@desc Creates a character select player

var _player = argument[0];
var _name = argument[1];
var _color = argument[2];
var _isActive = argument[3];
var _marker = argument[4];
var _sprite = argument[5];

var _item = noone;

with (obj_character_select_player)
{
	if (player == _player)
	{
		name = _name;
		color = _color;
		isActive = _isActive;
		marker = _marker;
		sprite = _sprite;
		_item = self;
		break;
	}
}

return _item;