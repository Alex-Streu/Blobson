//Up Aerial
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_uair_ike;
			anim_speed=0;
			anim_frame=0;
			
			landing_lag=10;
			set_speed(0,-1,true,true);
			attack_frame=12;
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
				attack_frame=12;
				create_melee(30,-38,1.1,1.6,7,8,0.9,7,110,5,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==6)
				{
				//Animation
				anim_frame=2;
				
				create_melee(0,-48,1.2,1,8,9,0.8,8,90,6,HITBOX_SHAPE.circle,0);
				create_melee(-30,-16,0.9,1.1,7,6,0.5,6,160,8,HITBOX_SHAPE.circle,0);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=10;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame<6)
				anim_frame=4;
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();