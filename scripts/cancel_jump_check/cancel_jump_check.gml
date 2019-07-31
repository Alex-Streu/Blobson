///@func cancel_jump_check()
///@desc Cancels an attack if you can jump
if (button(INPUT.jump,buff))
	{
	if (on_ground())
		{
		attack_stop(PLAYER_STATE.jumpsquat);
		jumpsquat_frame=jumpsquat_time;
		return true;
		}
	else
	if (double_jumps>0)
		{
		attack_stop(PLAYER_STATE.aerial);
		double_jump();
		return true;
		}
	}
return false;