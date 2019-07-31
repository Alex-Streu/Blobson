//Neutral Special
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions / Cancels
if (!on_ground())
	{
	friction_gravity(air_friction,grav,max_fall_speed);
	aerial_drift();
	}
else
	{
	friction_gravity(ground_friction,grav,max_fall_speed);
	}
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_nspec_falcon_punch;
			anim_frame=0;
			anim_speed=0;
			
			attack_frame=46;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame<40)
				anim_frame=1;
			if (attack_frame<20)
				anim_frame=2;
			
			if (attack_frame==0)
				{
				//Animation
				anim_frame=3;
				
				var _attack_power=9, _pre_facing=facing;
				change_facing();
				//Turn around powerup
				if (_pre_facing!=facing)
					_attack_power=10;
				
				//Speeds
				set_speed(facing*6,0,false,false);
				if (!on_ground())
					{
					set_speed(0,-1,true,false);
					}
				
				create_melee(15,-2,1,0.6,20,_attack_power,1,20,35,4,HITBOX_SHAPE.rectangle,0);
				attack_frame=4;
				attack_phase++;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==0)
				{
				//Whiff lag
				attack_frame = attack_has_hit() ? 31 : 40;
				attack_phase++;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==30)
				anim_frame=4;
			if (attack_frame==20)
				anim_frame=5;
			if (attack_frame==10)
				anim_frame=6;
			
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