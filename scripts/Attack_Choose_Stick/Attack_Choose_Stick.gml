///@func Attack_Choose_Stick([possible_inputs])
///@param [possible_inputs]
///If one stick is set to movement and the other to attacking,
///the attacking stick is chosen.
var _stick_r=cc[@ 11];
for(var i=0;i<argument_count;i++)
	{
	if (_stick_r==argument[i])
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