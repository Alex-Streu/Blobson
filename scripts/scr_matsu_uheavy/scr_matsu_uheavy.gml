//Forward Smash for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(slide_friction,grav,max_fall_speed);
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
			anim_sprite= my_sprites[?"Uheavy" ]
			anim_frame=0;
			anim_speed=0;
		
			smash_charge=0;
		
			attack_frame=smash_attack_max_charge;
			return;
			}
		//Charging -> Startup
		case 0:
			{
			//Animation (every 8 frames switch the sprite)
			if (smash_charge % 8 == 0)
				{
				if (anim_frame==0)
					{
					anim_frame=0;
					}
				else
					{
					anim_frame=0;
					}
				}
			
			smash_charge++;
			if (smash_charge>=smash_attack_max_charge || attack_frame==0 || !button_hold(INPUT.smash,1))
				{
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
						//frame 2 
			case 1:
			{			
			if (attack_frame==0)
				{
				set_speed(facing*4,0,false,false);
				anim_frame= 1;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
									//frame 3
			case 2:
			{			
			if (attack_frame==0)
				{
				set_speed(facing*4,0,false,false);
				anim_frame= 2;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
						
		// Frame 4 - first hit
		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				set_speed(facing*4,0,false,false);
				anim_frame= 3;								
				attack_phase++;
				attack_frame=2;
				var _damage = calculate_smash_damage(6);				
				var _hitbox = create_melee(30,-56,0.5,1.2,12,12,1.3,12,80,2,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_uheavy_hit);			
				//create_magnetbox(50,-64,0.7,0.6,_damage,5,80,0,5,3,HITBOX_SHAPE.circle,0);
				}
			break;
			}
			
					// Frame 5 - second hit - heavy sweet spot
		case 4:
			{
			if (attack_frame==0)
				{
				//Animation
				set_speed(facing*4,0,false,false);
				anim_frame= 4;								
				attack_phase++;
				attack_frame=5;
				var _damage = calculate_smash_damage(8);
				var _hitbox = create_melee(20,-80,0.5,1.2,12,12,1.3,12,80,4,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_uheavy_hit);	
				//create_magnetbox(50,-64,0.7,0.6,_damage,5,80,0,5,3,HITBOX_SHAPE.circle,0);
				}
			break;
			}
			
			//frame 6
			case 5:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
						//frame 7
			case 6:
			{			
			if (attack_frame==0)
				{
				anim_frame= 6;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 8
			case 7:
			{			
			if (attack_frame==0)
				{
				anim_frame= 7;
				attack_phase++;
				attack_frame=12;
				}
			break;
			}
			
			
		//Finish
		case 8:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=7;
				
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