///@func cancel_ground_check()
///@desc Cancels an attack if you are on the ground
//Applies landing lag
if (on_ground())
	{
	attack_stop(PLAYER_STATE.in_lag);
	lag_frame=landing_lag;
	return true;
	}
return false;