//Up Aerial
//Logic Control Variable
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame, 0);

//Actions
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
hitfall_try();
aerial_drift();

//Cancels
if run && cancel_ground_check()	run = false;

//Main Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			anim_sprite = spr_uair_mario;
			anim_frame = 0;
			anim_speed = 0;
			
			landing_lag = 10;
			set_speed(0, -1, true, true);
			attack_frame = 3;
			return;
			}
		//Active
		case 0:
			{
			//Animation
			if (attack_frame == 2)
				anim_frame = 1;
  
			//Initial Hit
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 2;
				
				create_melee(26, 0, 0.4, 0.4, 7, 6, 0.6, 8, 75, 2, HITBOX_SHAPE.circle, 0);
				
				//Next phase
				attack_phase++;
				attack_frame = 8;
				}
			break;
			}
		//Endlag
		case 1:
			{
			if (attack_frame == 7)
				{
				//Animation
				anim_frame = 3;
				
				create_melee(12, -36, 0.5, 0.5, 7, 6, 0.6, 7, 75, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				create_melee(24, -20, 0.3, 0.3, 7, 6, 0.6, 7, 75, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame == 5)
				{
				//Animation
				anim_frame = 4;
				
				create_melee(-20, -28, 0.6, 0.6, 7, 6, 0.6, 7, 75, 4, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				create_melee(0, -38, 0.5, 0.5, 7, 6, 0.6, 7, 75, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			//Animation
			if (attack_frame == 2)
				anim_frame = 5;
				
			if (attack_frame == 0)
				{
				//Whiff lag
				attack_phase++;
				attack_frame = attack_has_hit() ? 18 : 22;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 14)
				anim_frame = 6;
			if (attack_frame == 7)
				anim_frame = 7;
			
			//Autocancel
			if (attack_frame == 16)
				landing_lag = 3;
			
			if (attack_frame == 0)
				{
				//Revert back to the original state
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move_();