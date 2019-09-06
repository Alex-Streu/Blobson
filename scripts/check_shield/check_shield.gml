///@func check_shield()
///@desc Allows players to shield when holding the button
//If you are holding the shield button
switch(shield_type)
	{
	case SHIELD.melee:
		{
		if (button_hold(INPUT.shield))
			{
			//Change to shielding state
			set_state(PLAYER_STATE.shielding);
			shield_frame = shield_min_time;
			return true;
			}
		break;
		}
	case SHIELD.rivals:
		{
		if (button(INPUT.shield, buff))
			{
			//Change to parrying state
			anim_frame = 0;
			set_state(PLAYER_STATE.parrying);
			parry_frame = parry_startup;
			return true;
			}
		break;
		}
	}
return false;