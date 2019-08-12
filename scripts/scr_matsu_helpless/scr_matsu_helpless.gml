///Standard_Helpless
//Contains the standard actions for the helpless state.
var run=true;
#region Animation
anim_sprite=my_sprites[?"Helpless"];
anim_speed=anim_speed_normal;
#endregion
#region Friction / Gravity
friction_gravity(air_friction,grav,max_fall_speed);
#endregion
#region Ledge
if run && check_ledge_grab() run=false;
#endregion
#region Drift DI
//If stick is past threshold
if (stick_tilted(Lstick))
	{
//Drift DI cannot be used to speed up knockback to high speeds
	var _val = sign(stick_get_value(Lstick, DIR.horizontal));
	if (_val == sign(hsp))
        {
		if (abs(hsp+helpless_accel*_val)<helpless_max_speed)
			hsp+=helpless_accel*_val;
		}
	else
		{
		hsp+=helpless_accel*_val;
		}
	}
#endregion
#region Fastfalling
if (run) fastfall_try();
#endregion
#region Hard Landing
if (run && on_ground())
	{
	set_state(PLAYER_STATE.in_lag);
	lag_frame=landing_lag;
	run=false;
	}
#endregion
move_();