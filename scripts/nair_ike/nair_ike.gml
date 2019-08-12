//Neutral Aerial
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
			anim_sprite = spr_nair_ike;
			anim_speed = 0;
			anim_frame = 0;
		
			landing_lag = 12;
			set_speed(0, -1, true, true);
			attack_frame = 9;
			return;
			}
		//Startup
		case 0:
			{
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 1;
			
				attack_phase++;
				attack_frame = 12;
				create_melee(32, -28, 0.6, 0.5, 7, 6, 0.5, 9, 80, 3, HITBOX_SHAPE.circle, 0);
				}
			break;
			}
		//Active
		case 1:
			{
			if (attack_frame == 9)
				{
				//Animation
				anim_frame = 2;
				create_melee(30, 26, 0.7, 0.8, 7, 8, 0.5, 9, 80, 3, HITBOX_SHAPE.circle, 0);
				create_melee(45, 0, 0.7, 0.7, 7, 8, 0.5, 9, 80, 3, HITBOX_SHAPE.circle, 0);
				}
			if (attack_frame == 6)
				{
				//Animation
				anim_frame = 3;
				create_melee(-18, 32, 1, 0.7, 6, 7, 0.5, 9, 80, 3, HITBOX_SHAPE.circle, 0);
				}
			if (attack_frame == 3)
				{
				//Animation
				anim_frame = 4;
				create_melee(-48, -4, 0.6, 0.7, 6, 6, 0.5, 9, 80, 3, HITBOX_SHAPE.circle, 0);
				}
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 5;
			
				attack_phase++;
				attack_frame = attack_has_hit() ? 14 : 20;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 13)
				anim_frame = 6;
			//Autocancel
			if (attack_frame < 14)
				{
				landing_lag = 4;
				}
			if (attack_frame == 0)
				{
				set_state(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();