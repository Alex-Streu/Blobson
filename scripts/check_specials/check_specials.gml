///Checks for special attacks
//If one stick is set to attack it overrides the direction of the other stick
var _stick=Attack_Choose_Stick(INPUT.special);
//Special Attacks (ground or aerial)
if (button(INPUT.special,buff))
	{
	//Change direction
	change_facing(_stick);	
	//Uspec
	if (stick_tilted(_stick,DIR.up))
		{
		attack_start(my_attacks[?"Uspec"]);
		}
	else
	//Dspec
	if (stick_tilted(_stick,DIR.down))
		{
		attack_start(my_attacks[?"Dspec"]);
		}
	else
	//Fspec
	if (stick_tilted(_stick,DIR.horizontal))
		{
		attack_start(my_attacks[?"Fspec"]);
		}
	else
	//Nspec
		{
		attack_start(my_attacks[?"Nspec"]);
		}
	return true;
	}
return false;