///@func create_character_select_player(player, name, color, marker, sprite, cursor)
///@param player
///@param name
///@param color
///@param marker
///@param sprite
///@param cursor
///@desc Creates a character select player

var arg = 0;
var _player = argument[arg++];
var _name = argument[arg++];
var _color = argument[arg++];
var _marker = argument[arg++];
var _sprite = argument[arg++];
var _cursor = argument[arg++];

var _item = noone;

with (obj_character_select_slot)
{
	if (player == _player)
	{
		name = _name;
		color = _color;
		marker = _marker;
		sprite = _sprite;
		cursorSprite = _cursor;
		isLoaded = true;
		_item = id;
		break;
	}
}

return _item;