///@func pm_add_player(player)
///@param player
///@desc Adds player to player manager
var _player = argument[0];

with (obj_player_manager)
{
	players[_player[? "Number"]] = _player;
}