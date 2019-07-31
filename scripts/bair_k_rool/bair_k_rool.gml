//Backward Aerial
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
			anim_sprite=spr_bair_k_rool;
			anim_speed=0;
			anim_frame=0;
			landing_lag=10;
			set_speed(0,-1,true,true);
			attack_frame=13;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame==9)
				anim_frame=1;
			if (attack_frame==4)
				anim_frame=2;
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				attack_frame=4;
				create_melee(-18,-20,0.4,0.4,3,5,0.2,3,110,4,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==3)
				{
				//Animation
				anim_frame=4;
				
				create_melee(-38,0,0.5,0.5,5,6,0.2,6,120,4,HITBOX_SHAPE.circle,0);
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=5;
				
				attack_phase++;
				attack_frame=15;
				create_melee(-30,25,0.6,0.6,9,5,1,10,255,1,HITBOX_SHAPE.circle,1);
				create_melee(-40,16,0.6,0.7,8,7,0.7,5,140,8,HITBOX_SHAPE.circle,1);
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==12)
				anim_frame=6;
			if (attack_frame==9)
				anim_frame=7;
			if (attack_frame==6)
				anim_frame=8;
			
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