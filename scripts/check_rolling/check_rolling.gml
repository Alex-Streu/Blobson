///@func check_rolling()
///@desc Transition to roll state if you are holding shield and flick the control stick left or right
//If you are pressing a direction and the dodge buttons
if (button(INPUT.shield, buff))
	{
	if (stick_tilted(Lstick, DIR.horizontal))
		{
		audio_play_sound(choose(vc_dodgeroll1, vc_dodgeroll2,vc_nothing),10,false);
		audio_play_sound(sfx_dodgeroll,10,false)
		anim_frame = 0;
		set_state(PLAYER_STATE.rolling);
		//Facing
		change_facing();
		//Set the rolling direction
		rolling_direction = facing;
		return true;
		}
	}
return false;