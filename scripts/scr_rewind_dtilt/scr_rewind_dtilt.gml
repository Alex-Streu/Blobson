//Down Tilt for character0
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
			anim_sprite= my_sprites[?"Dtilt"];
			anim_frame=0;
			anim_speed=0;			
		
			attack_frame=7;
			return;
			}
		//Add startup frames
		case 0:
			{
			//Animation
			anim_sprite= my_sprites[?"Dtilt"];
			anim_frame=0;
			anim_speed=0;
		
			attack_frame=4;
			attack_phase++;
			break;
			}
			
				case 1:
			{
			//Animation
			anim_frame=1;
			anim_speed=0;
		
			attack_frame=4;
			attack_phase++;
			break;
			}
			
		//Startup -> Active
		case 2:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=3;
				var _hitbox = create_melee(80,-37,1.4,0.6,6,8,1.2,12,70,3,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_dtilt_hit);
				}
			break;
			}

		case 3:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				attack_phase++;
				attack_frame=3;				
				var _hitbox = create_melee(76,-37,1.4,0.6,6,8,1.2,12,70,3,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX.snd_hit,snd_dtilt_hit);
				}
			break;
			}
		
		//Active
		case 4:
			{
			if (attack_frame==0)
				{
				anim_frame=4;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			//Active
		case 5:
			{
			if (attack_frame==0)
				{
				anim_frame=5;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
			
			
		//Finish
		case 6:
			{
			//Animation
			anim_frame=5;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.crouching);
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