///@func check_dash()
///@desc Transition to dash state (which then goes to the running state)
//If the control stick is past a threshold
if (stick_flicked(Lstick,DIR.horizontal))
	{
	//Change the facing direction
	change_facing();
	//Set the state to dashing and stop the script.
	set_state(PLAYER_STATE.dashing);
	return true;
	}
return false;