//Forward Aerial for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_attack_try();
allow_hitfall();
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
			anim_sprite=spr_fair0;
			anim_speed=0;
			anim_frame=0;
			
			landing_lag=14;
			set_speed(0,-1,true,true);
			attack_frame=6;
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
				attack_frame=4;
				//Normal
				create_melee(30,-6,0.85,0.75,8,10,0.3,6,50,4,HITBOX_SHAPE.circle,0);
				//Tipper
				create_melee(40,-10,0.85,0.8,10,8,1,16,45,4,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
				
				attack_phase++;
				attack_frame=20;
				//Normal
				create_melee(40,12,0.7,0.9,8,10,0.3,6,50,4,HITBOX_SHAPE.circle,0);
				//Tipper
				create_melee(46,10,0.8,1,10,8,1,16,45,4,HITBOX_SHAPE.circle,0);
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==16)
				anim_frame=3;
			
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