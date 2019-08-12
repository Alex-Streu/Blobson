///@func check_wall_jump()
///@desc Checks if the player is able to wall jump
if (wall_jumps > 0 && wall_jump_timeout == 0)
	{
	if (!on_ground())
		{
		//Rivals of Aether
		if (walljump_type == WALLJUMP.rivals)
			{
			if (stick_tilted(Lstick, DIR.right) && place_meeting(x + 1, y, obj_solid) && 
				(button(INPUT.jump, buff) || (scs_tap_jump && stick_flicked(Lstick, DIR.up))))
				{
				set_state(PLAYER_STATE.wall_jump);
				set_speed(0, 0, false, false);
				facing = -1;
				wall_jump_frame = wall_jump_startup;
				wall_jumps--;
				jump_is_midair_jump = false;
				jump_is_dash_jump = false;
				return true;
				}
			if (stick_tilted(Lstick, DIR.left) && place_meeting(x - 1, y, obj_solid) && 
				(button(INPUT.jump, buff) || (scs_tap_jump && stick_flicked(Lstick, DIR.up))))
				{
				set_state(PLAYER_STATE.wall_jump);
				set_speed(0, 0, false, false);
				facing = 1;
				wall_jump_frame = wall_jump_startup;
				wall_jumps--;
				jump_is_midair_jump = false;
				jump_is_dash_jump = false;
				return true;
				}
			}
		}
	}
return false;