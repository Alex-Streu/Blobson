///@func stick_tilted(stick,[directions])
///@param stick
///@param [directions]
//Get the index of the sticks on the input buffer
//Can additionally check if the stick is tilted in any of the given directions
var _stick=(argument[0]==Lstick ? 25 : 23);
if (input_buffer[| _stick]==0)
	{
	if (argument_count>1)
		{
		if (stick_direction(argument[0],argument[1]))
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