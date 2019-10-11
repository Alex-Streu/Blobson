//for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 15 of dspecial dive   
		case PHASE.start:
			{
			//Animation
			anim_sprite= spr_sarina_dspecial_dive
			anim_frame=14;	
			//anim_speed = .75;
			anim_speed = 0;
			attack_frame= 3;
			set_speed(8*facing,0,true,false);
			return;
			}
			#endregion
			#region   Frame 16
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 17
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
		    #region   Frame 18
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;
				attack_phase++;
				attack_frame=3;	
				}
			break;
			}
			#endregion
			#region   Frame 19
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region	 Frame 20
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region   Frame 21
		case 5:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
		#endregion				
			#region   Frame 22
		case 6:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;			
				attack_phase++;
				attack_frame = 3;
				}
			break;
			}
		#endregion				
		    #region   Finish
		case 7:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=21;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				anim_frame = 23
				run = false;
				}
			break;
			}
		}
	}
	#endregion
	#endregion
//Movement
move_grounded_();