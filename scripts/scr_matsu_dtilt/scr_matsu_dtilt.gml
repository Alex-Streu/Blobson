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
		
			attack_frame=7;
			attack_phase++;
			break;
			}
		//Startup -> Active
		case 1:
			{
			if (attack_frame==4)
				{
				//Animation
				anim_frame=1;
				attack_phase++;
				attack_frame=6;
				var _hitbox = create_melee(42,-15,1,0.5,4,4,0.8,10,30,2,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_utilt_hit);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
				attack_phase++;
				attack_frame=4;
				
				}
			break;
			}

		case 2:
			{
			if (attack_frame==4)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=5;				
				var _hitbox = create_melee(42,-15,1,0.5,4,4,0.4,10,30,2,HITBOX_SHAPE.rectangle,0);
				set_hitbox_property(_hitbox,HITBOX_PROPERTY.hit_sfx,snd_dtilt_hit);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				attack_phase++;
				attack_frame=4;
				}
			break;
			}
		
		//Active -> Endlag
		case 3:
			{
			if (attack_frame==0)
				{
				anim_frame=3;
				attack_phase++;
				attack_frame=5;
				}
			break;
			}
		//Finish
		case 4:
			{
			//Animation
			anim_frame=3;
			
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