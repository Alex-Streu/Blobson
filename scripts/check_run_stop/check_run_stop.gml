///@func check_run_stop()
///@desc Allows the player to stop running
//The player enters the run stop state when they are no longer tilting the control stick
if (!stick_tilted(Lstick,DIR.horizontal))
	{
	set_state(PLAYER_STATE.run_stop);
	run_stop_frame=run_stop_time;
	return true;
	}
return false;