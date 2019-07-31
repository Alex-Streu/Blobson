///Standard_Run_Stop
//Contains the standard actions for the run stop state.
var run=true;
//Timer
run_stop_frame=max(--run_stop_frame,0);
#region Animation
anim_sprite=my_sprites[?"Run_Stop"];
anim_speed= ani_speed_runstop;
#endregion
#region Friction
friction_gravity(ground_friction,grav,max_fall_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run=false;
#endregion
#region Crouching
if run && check_crouch() run=false;
#endregion
#region Jumping
if run && check_jump() run=false;
#endregion
#region Rolling
if run && check_rolling() run=false;
#endregion
#region Attacking
if run && check_smashes() run=false;
if run && check_grounds() run=false;
//if run && check_dash_attack() run=false;     //have this on for runstop to dash attack
if run && check_specials() run=false;
if run && check_dash_grab() run=false;
#endregion
#region Run Turnaround
if (run && sign(stick_value(Lstick,DIR.horizontal))!=sign(hsp) && sign(hsp)!=0 && stick_tilted(Lstick,DIR.horizontal))
	{
	set_state(PLAYER_STATE.run_turnaround);
	run_turnaround_direction=sign(stick_value(Lstick,DIR.horizontal));
	run_turnaround_frame=run_turn_time;
	run=false;
	}
#endregion
#region Return to Idle State
if (run && run_stop_frame==0)
	{
	set_state(PLAYER_STATE.idle);
	run=false;
	}
#endregion
move_();