//Grab for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction/2,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

//How much EX_meter is gained upon landing the attack.
meter_gain = 5;
meter_gain_magnet = 0;

#region Phases
if (run)
	{
	switch(_phase)
		{
			#region   Frame 1   
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Grab" ];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame= 4;
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
				attack_phase++;
				attack_frame=3;
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
			
				attack_phase++;
				attack_frame=2;
				
				}
			break;
			}
			#endregion
		    #region   Frame 4 - grabbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;
				attack_frame=2;
				create_grab(48,-78,0.4,0.3,44,0,2,HITBOX_SHAPE.rectangle);
				}
			break;
			}
			#endregion
			#region   Frame 5 - grab whiff
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;	
				audio_play_sound(choose(vc_grabmiss1,vc_grabmiss2),10,false);
				}
			break;
			}
			#endregion
			#region	 Frame 6
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;			
				attack_phase++;
				attack_frame=9;	
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
				attack_frame=3;	
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
				attack_frame=3;	
				}
			break;
			}
		#endregion				
			#region   Frame 9
		case 7:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=8;			
				attack_phase++;
				attack_frame=3;	
				}
			break;
			}
		#endregion				
		    #region   Frame 10
		case 8:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=9;			
				attack_phase++;
				attack_frame=3;	
				}
			break;
			}
		#endregion				
		    #region   Finish
		case 9:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=9;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				anim_frame = 0;
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