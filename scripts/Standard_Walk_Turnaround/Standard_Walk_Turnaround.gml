///Standard_Walk_Turnaround
//Contains the standard actions for the walk turnaround state.
var run = true;
//Timer
walk_turnaround_frame=max(--walk_turnaround_frame,0);
#region Transition back to walking
if (walk_turnaround_frame==0)
	{
	set_state(PLAYER_STATE.walking);
	run = false;
	}
#endregion
#region Transition to run turnaround
if (run && stick_flicked(Lstick))
	{
	set_state(PLAYER_STATE.run_turnaround);
	run_turnaround_frame=max(run_turn_time-walk_turnaround_frame,0);
	run_turnaround_direction=walk_turnaround_direction;
	run = false;
	}
#endregion
#region Animation
anim_sprite=my_sprites[?"Walk"];
anim_speed=ani_speed_walk;
#endregion
#region Facing
facing=walk_turnaround_direction;
#endregion
#region Walking
//Move based on input
//Acceleration
hsp+=walk_accel*walk_turnaround_direction;
//Maximums
hsp=clamp(hsp,-walk_speed,walk_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run = false;
#endregion
#region Drop Throughs
if run && check_drop_through() run = false;
#endregion
#region Jumping (RAR)
if run && check_jump() run = false;
#endregion
#region Rolling
if run && check_rolling() run = false;
#endregion
#region Attacking
if run && check_smashes() run = false;
if run && check_grounds() run = false;
if run && check_specials() run = false;
if run && check_grab() run = false;
#endregion
move_grounded_();