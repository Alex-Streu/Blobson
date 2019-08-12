///@func check_wall_cling()
///@desc Checks if the player is able to wall cling
if (can_wall_cling && wall_cling_timeout == 0)
	{
	if (!on_ground())
		{
		//Rivals of Aether
		if (walljump_type == WALLJUMP.rivals)
			{
			if (button_hold(INPUT.jump, 1))
				{
				if (stick_tilted(Lstick, DIR.right) && place_meeting(x + 1, y, obj_solid))
					{
					set_state(PLAYER_STATE.wall_cling);
					set_speed(0, 0, false, false);
					facing = -1;
					wall_cling_frame = 0;
					return true;
					}
				if (stick_tilted(Lstick, DIR.left) && place_meeting(x - 1, y, obj_solid))
					{
					set_state(PLAYER_STATE.wall_cling);
					set_speed(0, 0, false, false);
					facing = 1;
					wall_cling_frame = 0;
					return true;
					}
				}
			}
		}
	}
return false;