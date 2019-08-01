//Jab for character0
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
				EX_meter += 3;
			//Animation
			anim_sprite=my_sprites[?"Jab1"];
			anim_speed=0;
			anim_frame=0;
			audio_play_sound(snd_jab1,10,false);
           
		
			attack_frame=4;
			return;
			}
		//First Jab Startup + hitbox
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				
				anim_frame=1;
			
				attack_phase++;
				attack_frame=5;
				set_speed(facing*2,0,true,false);
				var _hitbox = create_melee(38,-72,0.7,0.5,4,4,0.1,5,75,5,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX.knockback_state,PLAYER_STATE.in_flinch);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_jab1_hit);
				}
			break;
			}
		//1st - 3rd frame (starting to pull punch back)
		case 1:
			{
			if (attack_frame==0)
				{
				anim_frame=2;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
					//1st - final frame (punch is fully pulled)
		case 2:
			{
			if (attack_frame==0)
				{
				anim_frame=3;
				attack_phase++;
				attack_frame=6;
				}
			break;
			}
			
		//First Jab Endlag
		case 3:
			{
			//Animation
			anim_frame=4;
			
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
		case 4:
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
		case 5:
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
		
		case 6:
			{
			if (attack_frame==0) 
				{
				//Continue jab combo				
				anim_frame= 2;
				attack_phase++;
				attack_frame=5;
				set_speed(facing*4,0,false,false);
				var _magnetbox = create_magnetbox(28,-68,1,0.45,3,5,55,5,22,5,HITBOX_SHAPE.rectangle,1);				
				set_hitbox_property(_magnetbox,HITBOX.base_hitlag,5);
				set_hitbox_property(_magnetbox,HITBOX.snd_hit,snd_jab2_hit);
				
				}
			break;
			}
					
			
		//2nd jab - forth frame starting to lower kick
		case 7:
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
			case 8:
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
		case 9:
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
			case 10:
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
			case 11:
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
			case 12:
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
		case 13:
			{
			//Animation
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=3;
				set_speed(facing*6,0,false,false);								
				var _hitbox = create_melee(52,-56,0.8,0.5,5,8,0.9,8,45,8,HITBOX_SHAPE.rectangle,2);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_jab3_hit);
				
				
				}
			break;
			}
			
			//3rd jab - fith frame
			case 14:
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
			case 15:
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
			case 16:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			

		//Third Jab Endlag
		case 17:
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