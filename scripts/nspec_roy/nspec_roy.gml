//Neutral Special
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
//Main Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Startup
			//Animation
			anim_sprite=my_sprites[?"Hitlag"];
			anim_speed=anim_speed_normal;
			attack_frame=16;
			smash_charge=0;
			return;
			}
		//Startup
		case 0:
			{
			if (attack_frame==0)
				{
				if (button_hold(INPUT.special,buff))
					{
					attack_frame=0;
					attack_phase=1;
					}
				else
					{
					attack_frame=10;
					attack_phase=2;
					}
				}
			break;
			}
		//Charging
		case 1:
			{
			//Release Charge
			if (!button_hold(INPUT.special,buff) || smash_charge >= 120)
				{
				attack_frame=10;
				attack_phase=2;
				}
			else
				{
				smash_charge++;
				}
			break;
			}
		//Active
		case 2:
			{
			if (attack_frame==0)
				{
				//Attack's power is based on the charge
				var _power = smash_charge < 120 ? clamp(smash_charge / 10,10,15) : 40;
				var _size = clamp(smash_charge/60,1,2);
				create_melee(40,-12,_size,_size,_power,_power,0.7,smash_charge/2,45,10,HITBOX_SHAPE.rectangle,0);
				attack_phase++;
				}
			break;
			}
		//Endlag
		case 3:
			{
			if (attack_frame==0)
				{
				//Whiff Lag
				attack_frame = attack_has_hit() ? 1 : 20;
				attack_phase++;
				}
			break;
			}
		//Finish
		case 4:
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