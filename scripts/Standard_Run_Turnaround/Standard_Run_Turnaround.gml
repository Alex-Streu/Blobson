///Standard_Run_Turnaround
//Contains the standard actions for the run turnaround state.
var run=true;
//Timer
run_turnaround_frame=max(--run_turnaround_frame,0);
#region Transition back to running
if (run_turnaround_frame==0)
	{
	//Make sure you're going in the right direction!
	if (sign(hsp)!=sign(run_turnaround_direction))
		{
		set_speed(0,0,false,false);
		}
	set_state(PLAYER_STATE.running);
	run=false;
	}
#endregion
#region Animation
anim_sprite=my_sprites[?"Run"];
anim_speed=anim_speed_normal;
#endregion
#region Facing
facing=run_turnaround_direction;
#endregion
#region Walking
//Move based on input
//Acceleration
hsp+=run_turn_accel*run_turnaround_direction;
//Maximums
hsp=clamp(hsp,-run_speed,run_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run=false;
#endregion
#region Drop Throughs
if run && check_drop_through() run=false;
#endregion
#region Jumping (RAR)
if run && check_jump() run=false;
#endregion
#region Rolling
if run && check_rolling() run=false;
#endregion
#region Attacking
if run && check_smashes() run=false;
//if run && check_dash_attack() run=false;
if run && check_grounds() run=false;
if run && check_specials() run=false;
if run && check_dash_grab() run=false;
#endregion
move_grounded_();