//Backward Aerial
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_bair_fox;
			anim_speed = 0;
			anim_frame = 0;
			
			landing_lag = 4;
			set_speed(0, -1, true, true);
			vsp_frac = 0;
			attack_frame = 7;
			return;
			}
		//Startup
		case 0:
			{
			//Animation
			if (attack_frame == 3)
				anim_frame = 1;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 2;
			
				attack_phase++;
				attack_frame = 3;
				landing_lag = 15;
				create_melee(-36, 0, 0.9, 0.4, 13, 4, 0.9, 8, 150, 3, HITBOX_SHAPE.circle, 0);
				}
			break;
			}
		//Active
		case 1:
			{
			//Animation
			if (attack_frame == 1)
				anim_frame = 3;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 4;
				
				attack_phase++;
				attack_frame = attack_has_hit() ? 15 : 20;
				landing_lag = 5;
				}
			break;
			}
		//Finish
		case 2:
			{
			if (attack_frame == 17)
				anim_frame = 5;
			if (attack_frame = 12)
				anim_frame = 6;
			if (attack_frame = 7)
				anim_frame = 7;
				
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();