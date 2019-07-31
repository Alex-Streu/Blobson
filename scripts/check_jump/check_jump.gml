///@func check_jump()
///@desc Allows jumping
//If the jump button is pressed
if (on_ground())
	{
	var _tap = (scs_tap_jump && stick_flicked(Lstick,DIR.up));
	if (button(INPUT.jump,buff) || _tap)
		{
		//Change state to jump state, set jumpsquat, and exit the script.
		set_state(PLAYER_STATE.jumpsquat);
		jumpsquat_frame=jumpsquat_time;
		//Special variables for SCS
		jump_is_shorthop=false;
		jump_buffer_aerial=false;
		jump_is_tap_jump=_tap;
		return true;
		}
	}
return false;