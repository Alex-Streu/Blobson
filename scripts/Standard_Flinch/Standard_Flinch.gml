///Standard_Flinch
//Contains the standard actions for the flinch state.
var run = true;
//Timer
flinch_frame = max(--flinch_frame, 0);
#region No vertical movement
set_speed(0, 0, true, false);
#endregion
#region Cancel into hitstun when in the air
if (run && !on_ground())
	{
	set_state(PLAYER_STATE.in_hitstun);
	hitstun_frame = flinch_frame;
	run = false;
	}
#endregion
#region Animation
anim_sprite = my_sprites[?"Lag"];
anim_speed = ani_speed_lag;
#endregion
#region When the lag is done
if (run && flinch_frame == 0)
	{
	//Return to idle state
	set_state(PLAYER_STATE.idle);
	run = false;
	}
#endregion
#region Friction / Gravity
friction_gravity(hard_landing_friction, grav, max_fall_speed);
#endregion
move_grounded_();