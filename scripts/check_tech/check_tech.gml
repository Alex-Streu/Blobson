///@func check_tech()
///@desc Allows the player to tech. Only for use in moving scripts
//Tech / tech roll based on inputs.
//If the tech button(s) is pressed
if (tech_buffer < tech_buffer_time)
	{
	tech_buffer = tech_lockout_time;
	change_facing();
	//Rolling only works on the ground, teching normally works on walls / ground
	if (on_ground())
		{
		//If the control stick is right / left
		if (stick_tilted(Lstick,DIR.horizontal))
			{
			set_speed(0,0,false,false);
			set_state(PLAYER_STATE.techrolling);
			techrolling_phase=0;
			techrolling_frame=techroll_startup;
			techrolling_direction=sign(stick_get_value(Lstick,DIR.horizontal));
			set_invulnerable(INV.invincible,techroll_startup);
			return true;
			}
		else
		//Normal Tech
			{
			set_speed(0,0,false,false);
			set_state(PLAYER_STATE.teching);
			teching_phase=0;
			teching_frame=tech_active;
			set_invulnerable(INV.invincible,tech_active);
			return true;
			}
		}
	//Normal Tech
	else
		{
		set_speed(0,0,false,false);
		set_state(PLAYER_STATE.teching);
		teching_phase=0;
		teching_frame=tech_active;
		set_invulnerable(INV.invincible,tech_active);
		return true;
		}
	}
else
	{
	//Hard landing / tumble
	//If the speed is 0 (was below minimum bounce speeds in the move_bounce scripts)
	//The vertical tech only works on the ground (not the ceiling!)
	if (vsp==0 && on_ground())
		{
		//Hitting the ground and not bouncing = Hard Landing Lag
		set_state(PLAYER_STATE.in_lag);
		lag_frame=hard_landing_lag;
		return true;
		}
	else
	if (hsp==0)
		{
		//Hitting a wall and not bouncing causes tumble
		set_state(PLAYER_STATE.in_tumble);
		}
	}
return false;