///@func check_shield()
///@desc Allows players to shield when holding the button
//If you are holding the shield button
switch(shield_type)
	{
	case 0:
		{
		if (button_hold(INPUT.shield))
			{
			//Change to shielding state
			set_state(PLAYER_STATE.shielding);
			shield_frame=shield_min_time;
			return true;
			}
		break;
		}
	case 1:
		{
		if (button(INPUT.shield,buff))
			{
			//Change to parrying state
			set_state(PLAYER_STATE.parrying);
			parry_frame=parry_startup;
			return true;
			
			if ((sign(stick_value(Lstick,DIR.horizontal))==sign(hsp) || sign(hsp)==0) && stick_tilted(Lstick,DIR.horizontal))
			{
			}
			
			
			}
		break;
		}
	}
return false;