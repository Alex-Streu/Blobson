//Ledge Attack for character0
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
//Canceling
if run && cancel_air_check() run=false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_ledge_attack0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=5;
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
				attack_frame=5;
				create_melee(20,10,1,0.5,6,9,0.6,3,40,3,HITBOX_SHAPE.circle,0,FLIPPER.from_player_center_horizontal);
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
				attack_frame = attack_has_hit() ? 5 : 12;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==3)
				anim_frame=3;
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_grounded_();