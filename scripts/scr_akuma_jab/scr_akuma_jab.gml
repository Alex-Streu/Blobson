//Jab for akuma
/*
- Press the button multiple times to continue the combo
- The first two hits can be canceled into tilts
*/
#region Run the attack, set the attack phases, the timer, and check for air cancel
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
#endregion

#region //Phases
if (run)
	{
	switch(_phase)
		{
			#region Frame 1 - jab 1
		case PHASE.start:
			{
			//Animation
			anim_sprite=my_sprites[?"Jab1"];								
			attack_frame=3;
			anim_frame = 0;
			return;
			}
			#endregion
			#region Frame 2 - jab 1
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			   audio_play_sound(snd_jab1,10,false);
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region Frame 3 - jab 1 + hitbox
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;			
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(56,-88,1,0.5,4,6,0.1,5,75,3,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_flinch);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_jab1_hit);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_fx_style,HIT_FX.hit1);
				}
			break;
			}
			#endregion
			#region Frame 4 - jab 1 + exmeter
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;			
				attack_phase++;
				attack_frame=3;
				set_speed(facing*3,0,true,false);
				#region ADD EX meter                               (add me in the (attack_frame==0) section
				if (attack_has_hit())   
				{
					EX_meter += 1;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion
				//set_hitbox_property(_hitbox,HITBOX_PROPERTY.EX_meter,5);					
				}
			break;
			}
			#endregion
			#region Frame 5 - jab 1 + add meter
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;			
				attack_phase++;
				attack_frame=3;				
				}
				
			break;
			}
			#endregion
			#region Frame 6 - jab 1
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5
			
				attack_phase++;
				attack_frame=3;
				}
			break;
			}		
			#endregion					
		    #region Frame 7 - jab 1 ending (check for ground attacks, jab extension, or no inputs)
		case 5:
			{
			//Animation
			anim_frame=6;
			anim_speed = 0;
			
			//Cancel into tilts from first jab
			if (stick_tilted(Lstick) && check_grounds())
				{
				break;
				}
			//Continue to next jab
			if (button(INPUT.attack,12))
				{
				attack_phase++;
				attack_frame=6;
				}
			//Auto end
			else if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
			#endregion
			
			#region Frame 1 - jab 2 (change the animation to second jab and play sound)
		case 6:
			{
			if (attack_frame==0)
				{
				anim_sprite=my_sprites[?"Jab2"];
				audio_play_sound(snd_jab2,10,false);
				anim_speed=0;
				anim_frame=0;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region Frame 2 - jab 2 + slide
		case 7:
			{
			if (attack_frame==0)
				{
				anim_frame=1;
				attack_phase++;
				attack_frame=3;
				set_speed(facing*4,0,false,false);
				}
			break;
			}
			#endregion
			#region Frame 3 - jab 2
		case 8:
			{
			if (attack_frame==0) 
				{
				//Continue jab combo				
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;												
				}
			break;
			}
			#endregion	
			#region Frame 4 - jab 2 + hitbox
		case 9:
			{
			if (attack_frame==0)
				{
				anim_frame=3;
				attack_phase++;
				attack_frame=3;
				var _hitbox2 = create_melee(60,-76,1.1,.5,4,8,0,5,70,4,HITBOX_SHAPE.rectangle,2);	
				set_hitbox_property(_hitbox2,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);				
				}
			break;
			}
			#endregion		
			#region Frame 5 - jab 2 + meter
			case 10:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=2;
				#region ADD EX meter
				if (attack_has_hit())   
				{
					EX_meter += 2;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 6 - jab 2
			case 11:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 7 - jab 2
			case 12:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion			
		    #region Frame 8 - jab 2 ending (check for ground attacks, jab extension, or no inputs)
		case 13:
			{
			//Animation
			anim_frame= 7;
			
			//Cancel into tilts from the second jab
			if (stick_tilted(Lstick) && check_grounds())
				{
				break;
				}
			//Continue to next jab
			if (button(INPUT.attack,12))
				{
				attack_phase++;
				attack_frame=4;
				}
			//Auto end
			else if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
			#endregion
			
			#region Frame 1 - jab 3 (change the animation to second jab and play sound)
			case 14:
			{			
			if (attack_frame==0)
				{
				anim_sprite=my_sprites[?"Jab3"];				
				audio_play_sound(snd_jab3,10,false);
				anim_frame= 0;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 2 - jab 3 - slide
			case 15:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=2;
				set_speed(facing*9,0,false,false);	
				}
			break;
			}
			#endregion
			#region Frame 3 - jab 3
			case 16:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=2;															
				
				}
			break;
			}
			#endregion
			#region Frame 4 - jab 3 - hitbox
		case 17:
			{
			//Animation
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=2;
				reset_hitbox_group(collided, 2); //reset hitbox so next one can connect
				var _hitbox3 = create_melee(60,-76,1.1,.5,5,10,1,5,50,3,HITBOX_SHAPE.rectangle,2);
				set_hitbox_property(_hitbox3,HITBOX_PROPERTY.hit_sfx,snd_jab3_hit);
				//_hitbox3.sprite_index = spr_sarina_jab3_hb;
				//if (facing == -1) {_hitbox3.image_xscale *= -1;}						
				}
			break;
			}
			#endregion
			#region Frame 5 - jab 3 - meter
			case 18:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=2;
				
				#region ADD EX meter                               (add me in the (attack_frame==0) section
				if (attack_has_hit())   
				{
					EX_meter += 3;
					}
				else
					{					
					EX_meter += 0;
					}
				#endregion
				}
			break;
			}
			#endregion
			#region Frame 6 - jab 3
			case 19:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 7 - jab 3
			case 20:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 8 - jab 3
			case 21:
			{			
			if (attack_frame==0)
				{
				anim_frame= 7;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 9 - jab 3
			case 22:
			{			
			if (attack_frame==0)
				{
				anim_frame= 8;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			#endregion
			#region Frame 10 - jab 3
			case 23:
			{			
			if (attack_frame==0)
				{
				anim_frame= 9;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion
			#region Frame 11 - jab 3
			case 24:
			{			
			if (attack_frame==0)
				{
				anim_frame= 10;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			#endregion			
            #region end the jab string
		//Third Jab Endlag
		case 25:
			{
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

//Hurtbox matching
//if (run)
//	{
//	hurtbox_match_animation();
//	}