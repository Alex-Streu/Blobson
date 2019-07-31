//Neutral Special
var run=true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Actions / Cancels
if (on_ground())
	{
	friction_gravity(ground_friction,grav,max_fall_speed);
	}
else
	{
	aerial_drift();
	friction_gravity(air_friction,grav,max_fall_speed);
	}
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite=spr_dspec0;
			anim_frame=0;
			anim_speed=0.5;
		
			attack_frame=8;
			return;
			}
		//Startup -> Shoot
		case 0:
			{
			if (attack_frame==0)
				{
				change_facing(Lstick);
				hsp-=facing*2;
				if (!on_ground())
					{
					set_speed(0,-1,true,true);
					}
				var proj=custom_projectile(obj_nspec_charge_shot,30,0,0.7,0.7,16,7,0.9,45,300,HITBOX_SHAPE.circle,12,0);
				proj.base_hitlag=30;
				attack_phase++;
				attack_frame=24;
				}
			break;
			}
		//Shoot -> Finish
		case 1:
			{
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_();