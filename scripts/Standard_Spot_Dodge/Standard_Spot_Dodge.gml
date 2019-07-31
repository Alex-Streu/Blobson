///Standard_Spot_Dodge
//Contains the standard actions for the spot dodge state.
var run=true;
//Timer
spot_dodge_frame=max(--spot_dodge_frame,0);
//Animation is done in the phase switch
#region Cancel in air
if (run && !on_ground())
	{
	set_state(PLAYER_STATE.aerial);
	run=false;
	}
#endregion
#region Transition through phases of spot dodging
if (run)
	{
	switch(spot_dodge_phase)
		{
		case 0:
			{
			//Animation
			anim_sprite=my_sprites[?"SDodge"];
			anim_speed=0;
			anim_frame=0;
			//No speed
			set_speed(0,0,false,false);
			if (spot_dodge_frame==0)
				{
				//Next phase
				spot_dodge_phase++;
				spot_dodge_frame=spot_dodge_active;
				//Invulnerability
				set_invulnerable(INV.type_invincible,spot_dodge_active);
				}
			break;
			}
		case 1:
			{
			//Animation
			anim_speed=anim_speed_normal;
			if (spot_dodge_frame==0)
				{
				spot_dodge_phase++;
				spot_dodge_frame=spot_dodge_endlag;
				}
			break;
			}
		case 2:
			{
			//Animation
			anim_speed=0;
			//End spot dodge
			if (spot_dodge_frame==0)
				{
				spot_dodge_phase=0;
				//Back to Idle State, unless Shield is being held down
				if (!check_shield())
					{
					set_state(PLAYER_STATE.idle);
					}
				else
					{
					set_state(PLAYER_STATE.shielding);
					}
				}
			break;
			}
		default: break;
		}
	}
#endregion
move_grounded_();