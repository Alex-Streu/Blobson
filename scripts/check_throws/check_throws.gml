///Checks for throws
var _stick = Lstick;
//Up Throw
if (stick_flicked(_stick, DIR.up, throw_flick_buff))
	{
	attack_start(my_attacks[?"UThrow"]);
	return true;
	}
else
//Down Throw
if (stick_flicked(_stick, DIR.down, throw_flick_buff))
	{
	attack_start(my_attacks[?"DThrow"]);
	return true;
	}
else
//Forward Throw / Backward Throw
	{
	//Is the control stick in the direction the player is facing?
	if (stick_flicked(_stick, DIR.horizontal, throw_flick_buff))
		{
		if (sign(stick_get_value(_stick, DIR.horizontal)) == sign(facing))
			{
			attack_start(my_attacks[?"FThrow"]);
			return true;
			}
		else
			{
			attack_start(my_attacks[?"BThrow"]);
			return true;
			}
		}
	}
return false;