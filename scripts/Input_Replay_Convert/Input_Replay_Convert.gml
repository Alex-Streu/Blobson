///@func Input_Replay_Convert(replay_buffer,input_buffer)
///@param replay_buffer
///@param input_buffer
///@desc Takes an input buffer and converts it to a string to be added to the replay list.
/*

- 26 inputs

*/
var _replay = argument[0],
	_input = argument[1];
	
//Make sure that the player input something
var _any_input = true;
for(var i = 0; i < (INPUT.length * 2); i++)
	{
	if (_input[| i] == 0)
		{
		_any_input = true;
		break;
		}
	}
	
//Loop through the inputs
if (_any_input)
	{
	buffer_write(_replay, buffer_bool, true);
	for(var m = 0; m < (INPUT.length * 2); m++)
		{
		buffer_write(_replay, buffer_bool, (_input[| m] == 0));
		}
	}
else
	{
	buffer_write(_replay, buffer_bool, false);
	}
	
//Control stick data (.xy)
buffer_write(_replay, buffer_s8, (stick_get_value(Lstick, DIR.horizontal) * 100));
buffer_write(_replay, buffer_s8, (stick_get_value(Lstick, DIR.vertical	) * 100));
buffer_write(_replay, buffer_s8, (stick_get_value(Rstick, DIR.horizontal) * 100));
buffer_write(_replay, buffer_s8, (stick_get_value(Rstick, DIR.vertical	) * 100));

/* DEBUG
buffer_write(_replay, buffer_s16, x);
buffer_write(_replay, buffer_s16, y);
buffer_write(_replay, buffer_u8, state);
buffer_write(_replay, buffer_u8, tech_buffer);
//*/