///@func check_drop_through()
///@desc Allows players to drop through platforms and restricts fastfalling
//Drops through a platform
//If the stick was flicked
if (stick_flicked(Lstick,DIR.down))
	{
	//If there's a platform under you but not a solid
	if (!on_solid(x,y) && on_plat(x,y))
		{
		//Move a pixel down so gravity will take effect
		if (!place_meeting(x,y+1,obj_solid))
			{
			y+=1;
			}
		set_state(PLAYER_STATE.aerial);
		//Set variable to restrict fastfalling
		can_fastfall=false;
		
		//-->Standard_Extra
		return true;
		}
	}
return false;