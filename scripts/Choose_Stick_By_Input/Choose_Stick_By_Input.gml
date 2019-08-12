///@func Choose_Stick_By_Input([possible_inputs])
///@param [possible_inputs]
///Allows the right stick to override the left stick
var _stick_r = cc[@ 11];
for(var i = 0; i < argument_count; i++)
	{
	if (_stick_r == argument[i])
		{
		if (stick_tilted(Rstick))
			{
			return Rstick;
			}
		else
			{
			return Lstick;
			}
		}
	}
return Lstick;