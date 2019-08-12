///Standard_Wall_Jump
//Contains the standard actions for the wall jump state.
var run = true;
//Timer
wall_jump_frame = max(--wall_jump_frame, 0);
#region Landing
if (run && check_landing()) run = false;
#endregion
#region Transition through phases of wall jumping
if (run)
	{
	switch(wall_jump_phase)
		{
		case 0:
			{
			//Speeds
			set_speed(0, 0, false, false);
			//Animation
			anim_sprite = my_sprites[?"WallJ"];
			anim_speed = 0;
		
			if (wall_jump_frame == 0)
				{
				wall_jump_phase++;
				wall_jump_frame = wall_jump_time;
				set_speed(wall_jump_hsp * facing, wall_jump_vsp, false, false);
				}
			break;
			}
		case 1:
			{
			//Speeds
			friction_gravity(air_friction, grav, max_fall_speed);
		
			//Animation
			anim_speed = anim_speed_normal;
		
			if (run && wall_jump_frame == 0)
				{
				wall_jump_phase = 0;
				wall_jump_frame = 0;
				wall_jump_timeout = wall_jump_normal_timeout;
				set_state(PLAYER_STATE.aerial);
				run = false;
				}
			
			//Cancels
			if (run && double_jumps > 0)
				{
				//If jump is being pressed
				var _tap = (scs_tap_jump && stick_flicked(Lstick, DIR.up));
				if (button(INPUT.jump, buff) || _tap)
					{
					double_jump();
					run = false;
					}
				}
			if (run && check_airdodge()) run = false; 
			break;
			}
		}
	}
#endregion
move_();