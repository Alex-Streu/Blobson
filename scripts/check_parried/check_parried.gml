///@func check_parried()
if (shield_type == 1)
	{
	if (has_been_parried)
		{			
		has_been_parried = false;
		set_state(PLAYER_STATE.parry_stun);
		parry_stun_frame = parry_stun_time;
		return true;
		}
	}
return false;