//F-special air for sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
//fastfall_attack_try();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 1;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_dspecial_bounce
			anim_speed=0;
			anim_frame=0;
			attack_frame= 3;
			landing_lag = 3;
			set_speed(2 * -facing, -18, false, false);
			return;
			}
			#endregion
			#region   Frame 2
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;	
				attack_frame = 2;
				attack_phase++;
				}
			break;
			}
			#endregion
			#region   Frame 3
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;		
				attack_frame = 2;
				attack_phase++;				
				}
			break;
			}
			#endregion
			#region   Frame 4
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;				
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region   Frame 5
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;				
				attack_phase++;
				attack_frame=2;				

				}
			break;
			}
			#endregion
			#region   Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;				
				attack_phase++;
				attack_frame=2;				

				}
			break;
			}
			#endregion
			#region   Frame 7
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=6;				
				attack_phase++;
				attack_frame=2;				

				}
			break;
			}
			#endregion
			#region   Frame 8
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=7;				
				attack_phase++;
				attack_frame=2;				
				}
			break;
			}
			#endregion
		    #region   Finish
		case 7:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=7;
			if (attack_frame==0)
				{
			   attack_stop(PLAYER_STATE.aerial);}
				run = false;	
			break;
			}
		}
	}
	#endregion
	#endregion
	
	
	
//Movement
Speed_Fraction();
move_x();
move_y();