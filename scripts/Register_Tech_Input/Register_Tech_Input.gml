///@func Register_Tech_Input(count)
///@param count
///@desc Controls tech inputs and tech lockout
if (tech_buffer >= tech_lockout_time)
	{
	if (state == PLAYER_STATE.in_hitlag || 
		state == PLAYER_STATE.in_hitstun || 
		state == PLAYER_STATE.in_tumble)
		{
		if (button(INPUT.shield,buff))
			{
			tech_buffer = 0;
			}
		}
	}
else if (argument[0])
	{
	tech_buffer++;
	}