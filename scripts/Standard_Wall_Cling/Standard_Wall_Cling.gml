///Standard_Wall_Cling
//Contains the standard actions for the wall cling state.
var run = true;
//Timer
wall_cling_frame = min(++wall_cling_frame, wall_cling_max_time);
#region Animation
anim_sprite = my_sprites[?"WallC"];
anim_speed = anim_speed_normal;
#endregion
#region Wall Jump
if (run && check_wall_jump()) run = false;
#endregion
#region Time out / Let go
//If the time ran out or if you are not holding towards a wall...
if (run)
	{
	//Rivals of Aether
	if (walljump_type == WALLJUMP.rivals)
		{
		if (wall_cling_frame == wall_cling_max_time ||
			!place_meeting(x + sign(stick_get_value(Lstick, DIR.horizontal)), y, obj_solid))
			{
			set_state(PLAYER_STATE.aerial);
			wall_cling_timeout = wall_cling_normal_timeout;
			}
		}
	}
#endregion