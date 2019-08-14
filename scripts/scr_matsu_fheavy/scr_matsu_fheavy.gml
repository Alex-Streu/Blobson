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
			anim_sprite= my_sprites[?"Fheavy" ]
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
				attack_frame=8;
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
						
		// Frame 3 - first hit
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				set_speed(facing*4,0,false,false);
				anim_frame=2;								
				attack_phase++;
				attack_frame=4;
				var _damage = calculate_smash_damage(4);
				
                var _hitbox = create_melee(48,-64,0.7,0.6,_damage,7,0,3,60,4,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy1_hit);				
				//create_magnetbox(50,-64,0.7,0.6,_damage,5,80,0,5,3,HITBOX_SHAPE.circle,0);
				}
			break;
			}
			
			case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				set_speed(facing*4,0,false,false);
				anim_frame=3;								
				attack_phase++;
				attack_frame=4;
				var _damage = calculate_smash_damage(4);				
				var _hitbox = create_melee(44,-64,0.7,0.6,_damage,7,0,3,60,4,HITBOX_SHAPE.circle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy2_hit);
				//create_magnetbox(50,-64,0.7,0.6,_damage,5,80,0,5,3,HITBOX_SHAPE.circle,0);
				}
			break;
			}
						//frame 5
			case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=2;
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
				attack_frame=2;
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
				attack_frame=2;
				}
			break;
			}
			
			//frame 8
			case 7:
			{			
			if (attack_frame==0)
				{
				set_speed(facing*4,0,false,false);
				anim_frame= 7;
				attack_phase++;
				attack_frame=4;
				var _damage = calculate_smash_damage(5);
				var _hitbox = create_melee(40,-66,1,0.6,_damage,6,0,3,60,4,HITBOX_SHAPE.rectangle,1);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy2_hit);				
				}
			break;
			}
			
			//frame 9
			case 8:
			{			
			if (attack_frame==0)
				{
				//set_speed(facing*4,0,false,false);
				anim_frame= 8;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 10
			case 9:
			{			
			if (attack_frame==0)
				{
				//set_speed(facing*4,0,false,false);
				anim_frame= 9;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 11
			case 10:
			{			
			if (attack_frame==0)
				{
				//set_speed(facing*4,0,false,false);
				anim_frame= 10;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 12
			case 11:
			{			
			if (attack_frame==0)
				{
				//set_speed(facing*4,0,false,false);
				anim_frame= 11;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 13
			case 12:
			{			
			if (attack_frame==0)
				{
				//set_speed(facing*4,0,false,false);
				anim_frame= 12;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 14
			case 13:
			{			
			if (attack_frame==0)
				{
				anim_frame= 13;
				attack_phase++;
				attack_frame=2;
				}
			break;
			}
			
			//frame 15
			case 14:
			{			
			if (attack_frame==0)
				{
					set_speed(facing*4,0,false,false);
				anim_frame= 14;
				attack_phase++;
				attack_frame=4;
				var _damage = calculate_smash_damage(8);
                var _hitbox = create_melee(70,-64,0.95,0.6,_damage,9,1.3,20,40,7,HITBOX_SHAPE.rectangle,2);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_fheavy3_hit);	

				}
			break;
			}
			
			//frame 16
			case 15:
			{			
			if (attack_frame==0)
				{
				anim_frame= 15;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 17
			case 16:
			{			
			if (attack_frame==0)
				{
				anim_frame= 16;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 18
			case 17:
			{			
			if (attack_frame==0)
				{
				anim_frame= 17;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
		//Third Hit -> Endlag
		case 18:
			{
			//Animation
			if (attack_frame==7)
				anim_frame=18;
		
			if (attack_frame==0)
				{
				//Animation
				anim_frame=18;
			
				set_speed(0,0,false,false);
				attack_phase++;
				attack_frame=14;
				}
			break;
			}
		//Finish
		case 19:
			{
			//Animation
			if (attack_frame==8)
				anim_frame=19;
				
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