///@func cancel_jump_check()
///@desc Cancels an attack if you can jump
var _tap = (scs_tap_jump && stick_flicked(Lstick, DIR.up));
if (button(INPUT.jump, buff) || _tap)
	{
	if (on_ground())
		{
		attack_stop(PLAYER_STATE.jumpsquat);
		jump_is_midair_jump = false;
		jumpsquat_frame = jumpsquat_time;
		jump_is_dash_jump = false;
		return true;
		}
	else
	if (double_jumps > 0)
		{
		attack_stop(PLAYER_STATE.aerial);
		double_jump();
		return true;
		}
	}
return false;