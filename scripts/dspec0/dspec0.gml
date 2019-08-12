//Neutral Special for character0
/*
- Can be jump canceled after the hitbox comes out
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
if (on_ground())
	{
	friction_gravity(ground_friction);
	}
else
	{
	friction_gravity(air_friction ,grav, max_fall_speed);
	}
//Actions
aerial_drift();
allow_hitfall();
fastfall_try();
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_dspec0;
			anim_frame = 0;
			anim_speed = 0;
			
			attack_frame = 4;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 2)
				anim_frame = 1;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 2;
				
				attack_phase++;
				attack_frame = 6;
				//Grounded versus aerial
				if (!on_ground())
					{
					create_melee(0, 0, 1, 1, 3, 4, 0.8, 2, 17, 3, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center);
					}
				else
					{
					create_melee(0, 0, 1, 1, 3, 4, 0.5, 2, 45, 3, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					}
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame == 4)
				anim_frame = 3;
				
			//Jump cancel
			if run && cancel_jump_check() run = false;
			
			if (run && attack_frame == 0)
				{
				attack_phase++;
				attack_frame = 10;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			anim_frame = 4;
			
			if (attack_frame == 0)
				{
				if (on_ground())
					{
					attack_stop(PLAYER_STATE.idle);
					}
				else
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				}
			break;
			}
		}
	}
//Movement
move_();