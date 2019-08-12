///@func stick_tilted(stick,[directions],[buffer_time])
///@param stick
///@param [directions]
///@param [buffer_time]
//Get the index of the sticks on the input buffer
//Can additionally check if the stick is tilted in any of the given directions
var _stick = (argument[0] == Lstick ? control_tilted_l : control_tilted_r);
var _buff = argument_count > 2 ? argument[2] : 0;
if (_stick <= _buff)
	{
	if (argument_count > 1)
		{
		//Check direction of the stick on the frame it was tilted
		if (stick_direction(argument[0], argument[1], _stick))
			{
			return true;
			}
		return false;
		}
	else
		{
		return true;
		}
	}
return false;