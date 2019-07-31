//Forward Tilt for character0
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
			anim_sprite=spr_ftilt0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=7;
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
				attack_frame=6;
				create_melee(35,2,1.1,0.6,5,7,1,5,45,3,HITBOX_SHAPE.circle,0,FLIPPER.sakurai);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame==4)
				anim_frame=2;
				
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=15;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==11)
				anim_frame=4;
			
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