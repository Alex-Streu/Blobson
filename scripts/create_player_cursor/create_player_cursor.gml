///@func create_player_cursor(slot, sprite)
///@param slot
///@param sprite
///@desc Creates a player cursor

var _slot = argument[0];
var _sprite = argument[1];

var _item = instance_create_layer(_slot.x + _slot.sprite_width/2, _slot.y + _slot.sprite_height/2, "CursorLayer", obj_player_cursor);

with (_item)
{
	sprite_index = _sprite;
	owner = _slot;
}

return _item;