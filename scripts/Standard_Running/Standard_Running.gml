///Standard_Running
//Contains the standard actions for the running state.
var run = true;
//Timer
dash_frame=max(--dash_frame,0);
#region Animation
anim_sprite=my_sprites[?"Run"];
anim_speed=anim_speed_normal;
#endregion
#region Running
//Accelerate in one direction
if ((sign(stick_get_value(Lstick,DIR.horizontal))==sign(hsp) || sign(hsp)==0) && stick_tilted(Lstick,DIR.horizontal))
	{
	hsp+=run_accel*sign(stick_get_value(Lstick,DIR.horizontal));
	}
//Maximums
hsp=clamp(hsp,-run_speed,run_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run = false;
#endregion
#region Crouching
if run && check_crouch() run = false;
#endregion
#region Shielding
if run && check_shield() run = false;
#endregion
#region Jumping
if (run && check_jump()) 
	{
	jump_is_dash_jump = true;
	run = false;
	}
#endregion
#region Stopping
if run && check_run_stop() run = false;
#endregion
#region Rolling
if run && check_rolling() run = false;
#endregion
#region Attacking
if run && check_smashes() run = false;
if run && check_dash_attack() run = false;
if run && check_specials() run = false;
if run && check_dash_grab() run = false;
#endregion
#region Run Turnaround
if (run && 
	sign(stick_get_value(Lstick, DIR.horizontal)) != facing && 
	sign(hsp) != 0 && 
	stick_tilted(Lstick, DIR.horizontal))
	{
	set_state(PLAYER_STATE.run_turnaround);
	if (stick_get_value(Lstick, DIR.horizontal) != 0)
		{
		run_turnaround_direction = sign(stick_get_value(Lstick, DIR.horizontal));
		}
	run_turnaround_frame = run_turn_time;
	//VFX
	var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
	_fx.fx_xs = 2 * -facing;
	run = false;
	}
#endregion
move_();