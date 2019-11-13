//backward throwfor Sarina
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
			anim_sprite= my_sprites[?"Bthrow" ]
			anim_speed=0;
			anim_frame=0;
			attack_frame= 2;
			set_speed(24*facing, 0,false,false);
			var _magnetbox = create_magnetbox(20,-56,1.3,1.5,3,1,44,0,35,2,HITBOX_SHAPE.rectangle,0)
			set_hitbox_property(_magnetbox,HITBOX_PROPERTY.hit_sfx,snd_bthrow_hit1); 
			audio_play_sound(snd_bthrow_hit1,10,false);
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
				set_speed(12*facing, 0,false,false);
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
				audio_play_sound(vc_bthrow,10,false);
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
				attack_frame = 2;
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
				attack_frame = 2;
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
				attack_frame = 2;
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
				attack_frame = 5;
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
				attack_frame = 2;
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
				attack_frame = 2;
				audio_play_sound(snd_bthrow2,10,false);
				}
			break;
			}
		#endregion						
			#region   Frame 14 - hitbox
		case 12:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=13;			
				attack_phase++;				
				attack_frame = 2;
				var _hitbox = create_melee(-92,-56,1.5,0.4,6,7,1,7,140,2,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_bthrow_hit2); 
				}
			break;
			}
		#endregion						
			#region   Frame 15
		case 13:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=14;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 16
		case 14:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=15;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 17
		case 15:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=16;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 18
		case 16:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=17;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 19
		case 17:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 20
		case 18:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=19;			
				attack_phase++;				
				attack_frame = 7;
				}
			break;
			}
		#endregion						
			#region   Frame 21
		case 19:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=20;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 22
		case 20:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=21;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			#region   Frame 23
		case 21:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=22;			
				attack_phase++;				
				attack_frame = 2;
				}
			break;
			}
		#endregion						
			
		    #region   Finish
		case 22:
			{
			//Animation
			if (attack_frame==1)
				anim_frame=23;
			if (attack_frame==0)
				{
					facing *= -1;
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
move_y();
Speed_Fraction();
move_x_grounded(16); // X movement along with pixel buffer of ledges.