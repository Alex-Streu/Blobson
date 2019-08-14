///Standard_Jumpsquat
//Contains the standard actions for the jumpsquat state.
/* NOTE - If you fall off a ledge while in jumpsquat, you will still jump.*/
var run = true;
//Timer
jumpsquat_frame = approach(jumpsquat_frame, 0, 1);
#region Animation
anim_sprite = my_sprites[?"JumpS"];
anim_speed = ani_speed_jump;
#endregion
#region Gravity
friction_gravity(0, grav, max_fall_speed);
#endregion
#region Airdodge out of jumpsquat (wavedash)
if (run && check_airdodge()) run = false;
#endregion
#region Jumping
if (run)
	{
	//If jumpsquat timer is done
	if (jumpsquat_frame == 0)
		{
		//Change state to aerial state, set speed, and exit the script.
		set_state(PLAYER_STATE.aerial);
		//VFX
		fx_create(spr_dust_jump, 1, 0, 30, x, bbox_bottom - 1, 2, 0);
		#region Short Hop Aerial
		jump_buffer_aerial = false;
		if (run && scs_short_hop_aerial && button(INPUT.attack, buff, false))
			{
			jump_is_shorthop = true;
			jump_buffer_aerial = true;
			run = false;
			}
		#endregion
		//Check for shorthops (if you're not holding the jump button when jumping happens)
		if ((!jump_is_tap_jump && !button_hold(INPUT.jump, 1)) ||
			(jump_is_tap_jump && !stick_tilted(Lstick, DIR.up)) ||
			(jump_is_shorthop))
			{
			vsp = -shorthop_speed;
			vsp_frac = 0;
			jump_is_shorthop = false;
			}
		else
		//Full jumps
			{
			vsp = -jump_speed;
			vsp_frac = 0;
			}
		jump_is_tap_jump = false;
		run = false;
		}
	}
#endregion
move_();