///Standard_Walking
//Contains the standard actions for the walking state.
var run = true;
//Timer
walk_to_dash_frame = max(--walk_to_dash_frame, 0);
#region Animation
anim_sprite = my_sprites[?"Walk"];
anim_speed = anim_speed_normal;
#endregion
#region Walking
//Move based on input
//Acceleration
hsp+=walk_accel * sign(stick_get_value(Lstick, DIR.horizontal));
//Maximums
hsp = clamp(hsp, -walk_speed, walk_speed);
#endregion
#region Change to Aerial State
if (run && check_aerial()) run = false;
#endregion
#region Crouching
if (run && check_crouch()) run = false;
#endregion
#region Drop Throughs
if (run && check_drop_through()) run = false;
#endregion
#region Jumping
if (run && check_jump()) run = false;
#endregion
#region Rolling
if (run && check_rolling()) run = false;
#endregion
#region Dashing
//If the control stick is past a threshold and the walk_to_dash_frame is not expired
if (run && walk_to_dash_frame > 0)
	{
	if (stick_flicked(Lstick,DIR.horizontal))
		{
		//Set the state to dashing and stop the script.
		set_state(PLAYER_STATE.dashing);
		//VFX
		var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		_fx.fx_xs = 2 * facing;
		//Reset variables
		walk_to_dash_frame = 0;
		dash_frame = dash_time;
		run = false;
		}
	}
#endregion
#region Idle
//If the control stick is within the threshold
if (run && !stick_tilted(Lstick, DIR.horizontal))
	{
	//Stop walking
	set_state(PLAYER_STATE.idle);
	run = false;
	}
#endregion
#region Walk Turnaround
if (run && 
	sign(stick_get_value(Lstick, DIR.horizontal)) != sign(hsp) &&
	sign(hsp) != 0 && 
	stick_tilted(Lstick, DIR.horizontal))
	{
	set_state(PLAYER_STATE.walk_turnaround);
	walk_turnaround_direction = sign(stick_get_value(Lstick, DIR.horizontal));
	walk_turnaround_frame = walk_turn_time;
	run = false;
	}
#endregion
#region Shielding
if (run && check_shield()) run = false;
#endregion
#region Attacking
if run && check_smashes() run = false;
if run && check_grounds() run = false;
if run && check_specials() run = false;
if run && check_grab() run = false;
#endregion
move_();