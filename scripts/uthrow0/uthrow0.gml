//Up Throw for character0
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Startup
			//Animation
			anim_sprite=spr_uthrow0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=3;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=10;
				create_targetbox(32,8,0.4,0.5,3,1,0,7,90,2,HITBOX_SHAPE.rectangle,0,grabbed_id);
				}
			break;
			}
		//Active -> Active -> Endlag
		case 1:
			{
			if (attack_frame==8)
				{
				//Animation
				anim_frame=2;
			
				var _hitbox = create_melee(32,4,0.4,0.8,3,16,0.7,5,95,8,HITBOX_SHAPE.circle,1);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_explosion2);
				}
			if (attack_frame==6)
				anim_frame=3;
			if (attack_frame=4)
				anim_frame=4;
			
			if (attack_frame==0)
				{
				attack_phase++;
				attack_frame=6;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			anim_frame=5;
		
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_grounded_();