///Checks for special attacks
//If one stick is set to attack it overrides the direction of the other stick
var _stick=Choose_Stick_By_Input(INPUT.special);
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
		//attack_start(my_attacks[?"Fspec"]);
		#region sarina f-special check
		if name = "Sarina"
		{
		attack_start(my_attacks[?"Fspec"]);
		}
		#endregion	
		#region takia f-special check
		if name = "Takia"
		{
		attack_start(my_attacks[?"Fspec"]);
		}
		#endregion	
		#region Akuma f-special check
		
		//This will check to make sure akuma can spin kick
		
		if name = "Akuma" and akuma_fspecial_ready = true and akuma_fspecial_cooldown <= 0
		{
		attack_start(my_attacks[?"Fspec"]);
		}
		#endregion
		
		
		}
	else
	//Nspec
		{
		attack_start(my_attacks[?"Nspec"]);
		}
	return true;
	}
return false;