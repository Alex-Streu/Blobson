///Standard_Grab_Release
//Contains the standard actions for the grab release state.
var run = true;
//Timer
grab_release_frame = max(--grab_release_frame, 0);
#region No vertical movement
vsp=0;
vsp_frac=0;
#endregion
#region Animation
anim_sprite = my_sprites[?"Lag"];
anim_speed = anim_speed_normal;
#endregion
#region Aerial
if run && check_aerial() run = false;
#endregion
#region When the lag is done
if (run && grab_release_frame == 0)
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