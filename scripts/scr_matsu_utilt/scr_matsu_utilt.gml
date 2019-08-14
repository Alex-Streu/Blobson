//Up Tilt for character0
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
		//Add startup frames
		case PHASE.start:
			{
			//Animation
			anim_sprite= my_sprites[?"Utilt" ];
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=3;
			return;
			}
			
			//frame 2 
			case 0:
			{			
			if (attack_frame==0)
				{
				anim_frame= 1;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//fraame 3 hit box
					case 1:
			{			
			if (attack_frame==0)
				{
				anim_frame= 2;
				attack_phase++;
				attack_frame=3;				
				var _hitbox = create_melee(36,-80,0.5,.9,5,8,0.6,8,85,6,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);
				}
			break;
			}
			
			//frame 4 
			case 2:
			{			
			if (attack_frame==0)
				{
				anim_frame= 3;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 5
			case 3:
			{			
			if (attack_frame==0)
				{
				anim_frame= 4;
				attack_phase++;
				attack_frame=3;
				}
			break;
			}
			
			//frame 6
			case 4:
			{			
			if (attack_frame==0)
				{
				anim_frame= 5;
				attack_phase++;
				attack_frame= attack_has_hit() ? 4 : 10;
				}
			break;
			}
			
		//Finish
		case 5:
			{
			//Animation
			anim_frame=5;
		
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