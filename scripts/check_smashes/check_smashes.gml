///Checks for smash attacks or aerials
//If one stick is set to attack it overrides the direction of the other stick
var _stick=Choose_Stick_By_Input(INPUT.smash);
//If the smash button was pressed
//Also checks the Special Control Setting A+B Smash
if (button(INPUT.smash,buff) ||
	(scs_AB_smash && button(INPUT.attack,buff,false) && button(INPUT.special,buff,false)))
	{
	//If the player is on the ground
	if (on_ground())
		{
		//Usmash
		if (stick_tilted(_stick,DIR.up))
			{
			attack_start(my_attacks[?"Usmash"]);
			}
		else
		//Dsmash
		if (stick_tilted(_stick,DIR.down))
			{
			attack_start(my_attacks[?"Dsmash"]);
			}
		else
		//Fsmash
			{
			//Change direction 
			change_facing(_stick);
			attack_start(my_attacks[?"Fsmash"]);
			}
		return true;
		}
	else
	//If the player is in the air
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
			if (sign(stick_get_value(_stick,DIR.horizontal))==sign(facing))
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
return false;