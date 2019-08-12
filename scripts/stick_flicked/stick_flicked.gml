///@func stick_flicked(stick,[direction],[buffer_time],[delete_input])
///@param stick
///@param [direction]
///@param [buffer_time]
//Get the index of the sticks on the input buffer
var _stick = (argument[0] == Lstick ? control_flicked_l : control_flicked_r);
var _buff = argument_count > 2 ? argument[2] : stick_flick_buff;
if (_stick <= _buff)
	{
	if (argument_count > 1)
		{
		//Check direction of the stick on the frame it was flicked
		if (stick_direction(argument[0], argument[1], _stick))
			{
			if (argument[0] == Lstick) control_flicked_l = max_buffer_length;
			else control_flicked_r = max_buffer_length;
			return true;
			}
		return false;
		}
	else
		{
		if (argument[0] == Lstick) control_flicked_l = max_buffer_length;
		else control_flicked_r = max_buffer_length;
		return true;
		}
	}
return false;