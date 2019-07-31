///@func check_spot_dodge()
///@desc Allows spot dodging
//If the control stick is flicked downwards
if (stick_flicked(Lstick,DIR.down))
	{
	//Set the state to spot dodging and stop the script.
	
	set_state(PLAYER_STATE.spot_dodging);
	spot_dodge_frame=spot_dodge_startup;
	return true;
	}
return false;