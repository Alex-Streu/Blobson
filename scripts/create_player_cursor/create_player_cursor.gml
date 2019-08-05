///@func create_player_cursor(player, slot, sprite)
///@param player
///@param slot
///@param sprite
///@desc Creates a player cursor

var _player = argument[0];
var _slot = argument[1];
var _sprite = argument[2];

var _item = instance_create_layer(_slot.x + _slot.drawW/2, _slot.y + _slot.drawH/2, "CursorLayer", obj_player_cursor);

with (_item)
{
	player = _player;
	slot = _slot;
	sprite_index = _sprite;
}