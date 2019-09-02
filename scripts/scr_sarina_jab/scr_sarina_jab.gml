//Jab for SARINA
/*
- Press the button multiple times to continue the combo
- The first two hits can be canceled into tilts
*/
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=my_sprites[?"Jab1"];
			anim_speed=0;
			anim_frame=0;			
			attack_frame=3;
			return;
			}
			
			//Frame 2 - JAB 1
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
			
			//Frame 3 - JAB 1
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			audio_play_sound(snd_jab1,10,false);
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//Frame 4 - JAB 1 + hitbox
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=3;
				set_speed(facing*3,0,true,false);
				var _hitbox = create_melee(38,-72,0.7,0.5,4,4,0.1,7,75,6,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_flinch);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_jab1_hit);
				//EX_meter += 3;
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_fx_style,HIT_FX.hit1);
				//fx_create(spr_fx_parry,1.5,0,18, x +19 * facing,y - 62,1,0);
				}
			break;
			}
			
			//Frame 5 - JAB 1
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
			
			//Frame 6 - JAB 1
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5
			
				attack_phase++;
				attack_frame=6;
				}
			break;
			}		
							
			
		//First Jab Endlag
		case 5:
			{
			//Animation
			anim_frame=6;
			
			//Cancel into tilts from first jab
			if (stick_tilted(Lstick) && check_grounds())
				{
				break;
				}
			//Continue to next jab
			if (button(INPUT.attack,12))
				{
				attack_phase++;
				attack_frame=3;
				}
			//Auto end
			else if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
			
			//2ND JAB-------------------------------------------------------------------
			
			
		//2nd jab- first frame (knee bent)
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
			
					//2nd jab- second frame (leg twist)
		case 7:
			{
			if (attack_frame==0)
				{
				anim_frame=1;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
		//2nd jab - third frame (kick hitbox)
		
		case 8:
			{
			if (attack_frame==0) 
				{
				//Continue jab combo				
				anim_frame= 2;
				attack_phase++;
				attack_frame=5;
				set_speed(facing*4,0,false,false);
				var _magnetbox = create_magnetbox(44,-58,1.1,0.45,3,5,75,5,22,5,HITBOX_SHAPE.rectangle,1);	
				set_hitbox_property(_magnetbox,HITBOX_PROPERTY.knockback_state,PLAYER_STATE.in_flinch);
				//set_hitbox_property(_magnetbox,HITBOX.base_hitlag,5);
				set_hitbox_property(_magnetbox,HITBOX_PROPERTY.hit_sfx,snd_jab2_hit);
				
				}
			break;
			}
					
			
		//2nd jab - forth frame starting to lower kick
		case 9:
			{
			if (attack_frame==0)
				{
				anim_frame=3;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
						
			//2nd jab - fith frame kicked leg bent
			case 10:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
		//Second Jab Endlag
		case 11:
			{
			//Animation
			anim_frame= 5;
			
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
			
						//3rd jab - first frame
			case 12:
			{			
			if (attack_frame==0)
				{
				anim_sprite=my_sprites[?"Jab3"];
				audio_play_sound(snd_jab3,10,false);
				anim_frame= 0;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
									//3rd jab - second frame
			case 13:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
												//3rd jab - third frame
			case 14:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
		//Third Jab - forth frame HITBOX
		case 15:
			{
			//Animation
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=3;
				set_speed(facing*6,0,false,false);								
				var _hitbox = create_melee(110,-56,1.4,1,5,8,0.9,8,45,8,HITBOX_SHAPE.rectangle,2);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_jab3_hit);
				
				
				}
			break;
			}
			
			//3rd jab - fith frame
			case 16:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
						//3rd jab - sixth frame
			case 17:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
						//3rd jab - seventh frame
			case 18:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=8;
				}
			break;
			}
			

		//Third Jab Endlag
		case 19:
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
//Movement
move_grounded_();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}