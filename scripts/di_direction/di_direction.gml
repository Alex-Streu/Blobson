///@func di_direction(initial_direction,stick_direction,max_di)
///@param initial_direction
///@param stick_x
///@param stick_y
///@param max_di
/* Note: This function is kinda hard to explain*/
var _dir, _max_di, di, _stick_direction, _temp;
_dir = argument0;
_max_di = argument2;
_stick_direction = argument1;

//If stick is past a threshold
if (stick_tilted(Lstick))
	{
	//Set a temporary placeholder variable, which holds the stick direction angle if the dir is always zero
	_temp = (_stick_direction - _dir);
	//If the angle is more than 90 degrees in any direction, it goes back to being zero slowly
	if (_temp > 90 && _temp <= 180)
		{
		_temp = (180 - _temp);
		}
	if (_temp < 270 && _temp >= 180)
		{
		_temp = (180 - _temp);
		}
	//The DI angle is the direction + the percent distance * the maximum DI.
	di = _dir + (angle_difference(_temp, 0) / 90) * _max_di;
	}
else
	{
	//No input means no DI
	di = _dir;
	}
return di;