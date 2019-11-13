//downward throw for Sarina
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
grab_frame=max(--grab_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;

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
			anim_sprite= my_sprites[?"Dthrow" ]
			anim_speed=0;
			anim_frame=0;
			attack_frame= 2;
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
				attack_frame=2;
				
			   //Move the grabbed player below
			   grabbed_id.grab_hold_x = 16 * facing;
			   grabbed_id.grab_hold_y = -20;
				
				audio_play_sound(vc_dthrow,10,false);
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
				//Move the grabbed player below
			   grabbed_id.grab_hold_x = 8 * facing;
			   grabbed_id.grab_hold_y = -40;
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
				//Move the grabbed player below
			   grabbed_id.grab_hold_x = 6 * facing;
			   grabbed_id.grab_hold_y = -48; 
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
				
				//Move the grabbed player below
			   grabbed_id.grab_hold_x = 24 * facing;
			   grabbed_id.grab_hold_y = -20;
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
				attack_frame = 2;
				//Move the grabbed player below
			   grabbed_id.grab_hold_x = 18 * facing;
			   grabbed_id.grab_hold_y = -5;
			   
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
				attack_frame = 2;
				var _hitbox = create_melee(-26,-32,1.5,0.5,6,7,1,10,110,2,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dthrow_hit);
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
				attack_frame = 3;
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
				attack_frame = 3;
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
				attack_frame = 3;
				}
			break;
			}
		#endregion				
			#region   Frame 11
		case 9:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=10;			
				attack_phase++;				
				attack_frame = 3;
				}
			break;
			}
		#endregion				
			#region   Frame 12
		case 10:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=11;			
				attack_phase++;				
				attack_frame = 3;
				}
			break;
			}
		#endregion				
			#region   Frame 13
		case 11:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=12;			
				attack_phase++;				
				attack_frame = 3;
				}
			break;
			}
		#endregion						
		    #region   Finish
		case 12:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=14;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
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