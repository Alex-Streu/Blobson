//Down Aerial for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(air_friction,grav,max_fall_speed);
fastfall_try();
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
			anim_sprite=spr_dair0;
			anim_speed=0;
			anim_frame=0;
		
			landing_lag=10;
			set_speed(0,-1,true,true);
			attack_frame=8;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame<4)
				anim_frame=1;
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame=4;
				create_melee(0,20,0.1,0.4,8,5,1.2,15,280,3,HITBOX_SHAPE.rectangle,0);
				create_melee(0,10,0.6,0.7,8,5,1,5,75,4,HITBOX_SHAPE.rectangle,0,FLIPPER.from_player_center_horizontal);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
			
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 12 : 22;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==6)
				{
				anim_frame=4;
				}
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