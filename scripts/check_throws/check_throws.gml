///Checks for throws
//If the control stick was tilted in a direction
if (stick_tilted(Lstick))
	{
	var _stick = Lstick;
	//Up Throw
	if (stick_tilted(_stick,DIR.up))
		{
		attack_start(my_attacks[?"UThrow"]);
		}
	else
	//Down Throw
	if (stick_tilted(_stick,DIR.down))
		{
		attack_start(my_attacks[?"DThrow"]);
		}
	else
	//Forward Throw / Backward Throw
		{
		//Is the control stick in the direction the player is facing?
		if (sign(stick_value(_stick,DIR.horizontal))==sign(facing))
			{
			attack_start(my_attacks[?"FThrow"]);
			}
		else
			{
			attack_start(my_attacks[?"BThrow"]);
			}
		}
	return true;
	}
return false;