///@func cancel_airdodge_check()
///@desc Cancels an attack if you can airdodge
if (air_dodges>0)
	{
	//Check if the dodge button is being pressed
	if (button(INPUT.shield,buff))
		{
		air_dodges--;
		//Set the state
		attack_stop(PLAYER_STATE.airdodging);
		return true;
		}
	}
return false;