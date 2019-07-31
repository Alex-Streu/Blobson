///@func stick_flicked(stick,[direction])
///@param stick
///@param [direction]
//Get the index of the sticks on the input buffer
var _stick=(argument[0]==Lstick ? 24 : 22);
if (input_buffer[| _stick]<stick_flick_buff)
	{
	if (argument_count>1)
		{
		if (stick_direction(argument[0],argument[1]) && stick_distance(argument[0]) > stick_flick_amount)
			{
			input_buffer[| _stick]=stick_flick_buff;
			return true;
			}
		return false;
		}
	else
		{
		input_buffer[| _stick]=stick_flick_buff;
		return true;
		}
	}
return false;