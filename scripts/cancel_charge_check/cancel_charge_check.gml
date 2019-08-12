///@func cancel_charge_check()
///@desc Cancels a "charging" attack.
//Jump cancel
if (cancel_jump_check()) 
	{
	return true;
	}	
//Grounded Cancels
if (on_ground())
	{
	//Roll
	if (stick_flicked(Lstick, DIR.horizontal))
		{
		set_state(PLAYER_STATE.rolling);
		//Facing
		change_facing();
		//Set the rolling direction
		rolling_direction = sign(stick_get_value(Lstick, DIR.horizontal));
		attack_stop();
		return true;
		}
	//Spot dodge
	if (stick_flicked(Lstick, DIR.down))
		{
		//Set the state to spot dodging and stop the script.
		set_state(PLAYER_STATE.spot_dodging);
		spot_dodge_frame = spot_dodge_startup;
		attack_stop();
		return true;
		}
	//Shield cancel
	if (check_shield())
		{
		attack_stop();
		return true;
		}
	}	
//Airdodge cancel
if (!on_ground() && check_airdodge())
	{
	attack_stop();
	return true;
	}	
return false;