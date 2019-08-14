///Standard_Tumble
//Contains the standard actions for the tumble state.
var run = true;
#region Animation
anim_sprite = my_sprites[?"Tumble"];
anim_speed = ani_speed_tumble;
#endregion
#region Friction / Gravity
friction_gravity(air_friction, grav, max_fall_speed);
#endregion
#region Ledge
if run && check_ledge_grab_falling() run = false;
#endregion
#region Drift DI
//If stick is past threshold
if (stick_tilted(Lstick, DIR.horizontal))
	{
	//Drift DI cannot be used to speed up knockback to high speeds
	if (sign(stick_get_value(Lstick, DIR.horizontal)) == sign(hsp))
		{
		if (abs(hsp + drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal))) < drift_DI_max)
			{
			hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
			}
		}
	else
		{
		hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
		}
	}
#endregion
#region Attack Cancel
if run && check_smashes() run = false;
if run && check_aerials() run = false;
if run && check_specials() run = false;
#endregion
#region Airdodge Cancel
if run && check_airdodge() run = false;
#endregion
#region Jump Cancel (not a normal double jump)
if (run && button(INPUT.jump, buff))
	{
	if (double_jumps > 0)
		{
		double_jumps--;
		vsp = -double_jump_speed;
		vsp_frac = 0;
		/*No horizontal speed change*/
		//VFX
		fx_create(spr_dust_air_jump, 1, 0, 18, x, y, 2, 0);
		set_state(PLAYER_STATE.aerial);
		run = false;
		}
	}
#endregion
#region Hard Landing
if (run && on_ground())
	{
	set_state(PLAYER_STATE.in_lag);
	lag_frame = hard_landing_lag;
	run = false;
	}
#endregion
move_bounce_();