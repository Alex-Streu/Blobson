///@func pm_update_player(player_num, character)
///@param player_num
///@param character
///@desc Updates player in player manager
var _player_num = argument[0],
	_character = argument[1];

with (obj_player_manager)
{
	var _player = players[_player_num];
	_player[? "Character"] = _character;
	players[_player_num] = _player;
}