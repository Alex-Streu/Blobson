//Up Throw for character0
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
			//Startup
			//Animation
			anim_sprite=spr_uthrow0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=11;
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
				attack_frame=14;
				create_melee(34,8,1.1,0.5,1,1,0,20,90,2,HITBOX_SHAPE.rectangle,0);
				}
			break;
			}
		//Active -> Active -> Endlag
		case 1:
			{
			if (attack_frame==11)
				{
				//Animation
				anim_frame=2;
			
				create_melee(45,4,1,0.8,9,6,1.1,10,85,8,HITBOX_SHAPE.circle,1);
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