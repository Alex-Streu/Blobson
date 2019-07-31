///Checks for aerial attacks
//If one stick is set to attack it overrides the direction of the other stick
var _stick=Attack_Choose_Stick(INPUT.attack);
//If the attack button was pressed
if (button(INPUT.attack,buff))
	{
	//If the player is in the air
	if (!on_ground())
		{
		//Diagonal Nair
		if (scs_diagonal_stick_nair &&
			(stick_tilted(_stick,DIR.up_right) ||
			stick_tilted(_stick,DIR.up_left) ||
			stick_tilted(_stick,DIR.down_right) ||
			stick_tilted(_stick,DIR.down_left)))
			{
			attack_start(my_attacks[?"Nair"]);
			}
		else
		//Uair
		if (stick_tilted(_stick,DIR.up))
			{
			attack_start(my_attacks[?"Uair"]);
			}
		else
		//Dair
		if (stick_tilted(_stick,DIR.down))
			{
			attack_start(my_attacks[?"Dair"]);
			}
		else
		//Fair / Bair
		if (stick_tilted(_stick,DIR.horizontal))
			{
			//Is the control stick in the direction the player is facing?
			if (sign(stick_value(_stick,DIR.horizontal))==sign(facing))
				{
				attack_start(my_attacks[?"Fair"]);
				}
			else
				{
				attack_start(my_attacks[?"Bair"]);
				}
			}
		else
		//Nair
			{
			attack_start(my_attacks[?"Nair"]);
			}
		return true;
		}
	}
//Tether Aerial
else if (button(INPUT.grab,buff))
	{
	if (!on_ground())
		{
		attack_start(my_attacks[?"Zair"]);
		return true;
		}
	}
return false;