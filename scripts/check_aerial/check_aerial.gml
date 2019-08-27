///@func check_aerial()
///@decs Transition to the aerial state if not on the ground
if (!on_ground())
	{
	//You're in the air
	anim_frame = 0;
	set_state(PLAYER_STATE.aerial);
	return true;
	}
return false;