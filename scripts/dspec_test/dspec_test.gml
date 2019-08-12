//Down Special
//Logic Control Variable
var run = true;
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
if run && cancel_jump_check() run = false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Startup
			attack_frame=10;
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
				
				create_melee(0,-10,0.8,0.8,50,10,1,50,290,40,HITBOX_SHAPE.circle,0,FLIPPER.from_hitbox_center_horizontal);
				}
			}
		//Endlag
		case 1:
			{
			move_attached_hitbox_group(0,1,8);
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