///@func Assign_Controllers()
//Assigns controllers to the player based on the global.device_number
var _num=0;
with(obj_player)
{
	controller = real(global.device_number[_num]);
	player_number = _num;
	player_color = _num + 1; //Offset for palettes
	_num++;
}