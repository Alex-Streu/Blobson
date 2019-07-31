///@func check_airdodge()
///@desc Transition to air dodge state if you press the button
//If you have another airdodge
if (air_dodges>0)
	{
	//Check if the dodge button is being pressed
	if (button(INPUT.shield,buff))
		{
		air_dodges--;
		//Set the state
		set_state(PLAYER_STATE.airdodging);
		return true;
		}
	}
return false;