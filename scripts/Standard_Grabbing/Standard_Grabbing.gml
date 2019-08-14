///Standard_Grabbing
//Contains the standard actions for the grabbing state.
//"Grabbing" refers to the state when a player is holding an opponent after connecting a grab hitbox
var run = true;
//Timer
grab_frame = max(--grab_frame, 0);
#region Animation
anim_sprite = my_sprites[?"Grabbing"];
anim_speed = ani_speed_grabhold;
#endregion
#region Friction & Gravity
friction_gravity(ground_friction, grav, max_fall_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run = false;
#endregion
#region Attacking
/*
show_debug_message("X: " + string(grabbed_id.x));
show_debug_message("Y: " + string(grabbed_id.y));
show_debug_message("IX:" + string(grabbed_id.grab_hold_x + x));
show_debug_message("IY:" + string(grabbed_id.grab_hold_y + y));
//*/
if ((grabbed_id.state == PLAYER_STATE.is_grabbed || grabbed_id.state == PLAYER_STATE.in_hitlag) &&
	(grabbed_id.x == (grabbed_id.grab_hold_x + x) && grabbed_id.y == (grabbed_id.grab_hold_y + y)))
	{
	#region Throw
	if run && check_throws() run = false;
	#endregion
	#region Pummel
	if run && check_pummel() run = false;
	#endregion
	}
#endregion
#region Grab Interrupt
//If the grabbed player is no longer being grabbed, the grab releases
if (grabbed_id.state != PLAYER_STATE.is_grabbed && grabbed_id.state != PLAYER_STATE.in_hitlag)
	{
	grab_release();
	}
#endregion
#region Grab Release
//Grabs end automatically when the grab frame times out without a throw
if (grab_frame == 0)
	{
	grab_release();
	}
#endregion
move_grounded_();