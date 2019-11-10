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
		#region sarina u-special check
		if name = "Sarina"
		{
		      if (on_ground())
	          {
	          attack_start(scr_sarina_uspecial_ground)    
	          }
		
		      else
			  {
				  attack_start(scr_sarina_uspecial_air )
			  }
		}
		#endregion	
		
		
		}
	else
	//Dspec
	if (stick_tilted(_stick,DIR.down))
		{
	
	    #region sarina d-special check - Slide kick or Dive kick
		if name = "Sarina"
		{
		      if (on_ground())
	          {
	          attack_start(scr_sarina_dspecial_slide )    
	          }
		
		      else
			  {
				  attack_start(scr_sarina_dspecial_air )
			  }
		}
		#endregion	
	
	//READD THIS SCRIPT OR MAKE OTHER  FIGHTERS LIKE SARINA
		//attack_start(my_attacks[?"Dspec"]);
		}
	else
	//Fspec
	if (stick_tilted(_stick,DIR.horizontal))
		{
		//attack_start(my_attacks[?"Fspec"]);
		#region sarina f-special check
		if name = "Sarina"
		{
		      if (on_ground())
	          {
	          attack_start(scr_sarina_fspecial_ground)    
	          }
		
		      else
			  {
				  attack_start(scr_sarina_fspecial_air )
			  }
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