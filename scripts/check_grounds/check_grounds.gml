///Checks for grounded attacks (Jab, Tilts, Taunt)
//If one stick is set to attack it overrides the direction of the other stick
var _stick=Choose_Stick_By_Input(INPUT.attack);
//If the player is on the ground
if (on_ground())
	{
	//If the attack button has been pressed
	if (button(INPUT.attack,buff))
		{
		//Change direction
		change_facing(_stick);
		//Utilt
		if (stick_tilted(_stick,DIR.up))
			{
			attack_start(my_attacks[?"Utilt"]);
			}
		else
		//Dtilt
		if (stick_tilted(_stick,DIR.down))
			{
			attack_start(my_attacks[?"Dtilt"]);
			}
		else
		//Ftilt
		if (stick_tilted(_stick,DIR.horizontal))
			{
			attack_start(my_attacks[?"Ftilt"]);
			}
		else
		//Jab
			{
			attack_start(my_attacks[?"Jab"]);
			}
		return true;
		}
	else
		{
		//Taunt
		if (button(INPUT.taunt,buff))
			{
			attack_start(my_attacks[?"Taunt"]);
			return true;
			}
		}
	}
return false;