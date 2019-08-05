///@func check_rolling()
///@desc Transition to roll state if you are holding shield and flick the control stick left or right
//If you are pressing a direction and the dodge buttons
if (button_hold(INPUT.shield,buff))
	{
	if (stick_tilted(Lstick,DIR.horizontal))
	if (button(INPUT.shield,buff))
		{
		set_state(PLAYER_STATE.rolling);
		//Facing
		change_facing();
		//Set the rolling direction
		rolling_direction=sign(stick_value(Lstick,DIR.horizontal));
		return true;
		}
	}
return false;
