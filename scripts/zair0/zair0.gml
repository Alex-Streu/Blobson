//Aerial Tether for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
aerial_drift();
//Canceling
if run && cancel_ground_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		//Add startup frames
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_zair0;
			anim_speed=0;
			anim_frame=0;
			landing_lag=10;
			set_speed(0,-1,true,true);
			attack_frame=9;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=15;
				create_melee(48,0,0.5,0.3,1,4,0.4,6,45,2,HITBOX_SHAPE.rectangle,0,FLIPPER.sakurai);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Multiple Hitboxes
			if (attack_frame==13)
				{
				//Animation
				anim_frame=2;
				
				create_melee(48,0,0.8,0.3,1,4,0.4,8,45,2,HITBOX_SHAPE.rectangle,1,FLIPPER.sakurai);
				}
			if (attack_frame==11)
				{
				//Animation
				anim_frame=3;
				
				create_melee(58,0,1,0.35,6,7,0.2,10,45,5,HITBOX_SHAPE.rectangle,2);
				if check_ledge_tether(256) return;
				}
			if (attack_frame==0)
				{
				//Animation
				anim_frame=4;
				
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 6 : 12;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==9)
				anim_frame=5;
			if (attack_frame==5)
				anim_frame=6;
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