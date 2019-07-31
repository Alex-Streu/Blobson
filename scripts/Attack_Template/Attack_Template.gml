//<Attack Name> for <Character Name>
//Logic Control Variable
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions
if (on_ground())
	{
	friction_gravity(ground_friction,grav,max_fall_speed);
	}
else
	{
	friction_gravity(air_friction,grav,max_fall_speed);
	fastfall_attack_try();
	aerial_drift();
	}
//Cancels
if run && cancel_air_check()	run=false;
if run && cancel_ground_check()	run=false;
if run && cancel_jump_check()	run=false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Startup
			//Animation
			anim_sprite=sprite_index;
			anim_speed=anim_speed_normal;
			anim_frame=0;
			attack_frame=1;
			return;
			}
		//Active
		case 0:
			{
			if (attack_frame==0)
				{
				//Create hitbox
				attack_frame=10;
				attack_phase++;
				}
			}
		//Endlag
		case 1:
			{
			if (attack_frame==0)
				{
				//Whiff Lag
				attack_frame = attack_has_hit() ? 1 : 2;
				attack_phase++;
				}
			break;
			}
		//Finish
		case 2:
			{
			if (attack_frame==0)
				{
				//Revert back to the original state - may be idle, aerial, crouching, etc.
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_();