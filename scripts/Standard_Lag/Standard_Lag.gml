///Standard_Lag
//Contains the standard actions for the lag state.
var run = true;
//Timer
lag_frame = max(--lag_frame, 0);
#region No vertical movement
vsp = 0;
vsp_frac = 0;
#endregion
#region Animation
anim_sprite = my_sprites[?"Lag"];
anim_speed = ani_speed_lag;
#endregion
#region Aerial
if run && check_aerial() run = false;
#endregion
#region When the lag is done
if (run && lag_frame == 0)
	{
	//Return to idle state
	set_state(PLAYER_STATE.idle);
	run = false;
	}
#endregion
#region Friction / Gravity
friction_gravity(hard_landing_friction, grav, max_fall_speed);
#endregion
move_();