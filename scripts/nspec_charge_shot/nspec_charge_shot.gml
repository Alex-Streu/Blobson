//Neutral Special
/*
- Press once to charge, press again to shoot
- Tilt the stick in the opposite direction right after starting to reverse the attack
- If at full charge, press once to shoot
- On the ground, you can cancel the charge with a roll, spot dodge, shield, or jump
- In the air, you can cancel the charge with an airdodge or jump
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Actions / Cancels
if (on_ground())
	{
	friction_gravity(ground_friction, grav, max_fall_speed);
	}
else
	{
	friction_gravity(air_friction, grav, max_fall_speed);
	}
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
			anim_speed = 0.5;
		
			//Reverse B
			reverse_b();
			
			//Variable management
			if (!variable_instance_exists(id, "nspec_charge_shot_charge"))
				{
				nspec_charge_shot_charge = 0;
				}
			attack_frame = 6;
			return;
			}
		//Startup
		case 0:
			{
			//B Reverse
			if (attack_frame == 2)
				{
				b_reverse();
				}
			if (attack_frame == 0)
				{
				//Charging
				if (nspec_charge_shot_charge < 180)
					{
					attack_phase++;
					attack_frame = 0;
					}
				else
					{
					attack_phase = 2;
					attack_frame = 8;
					}
				}
			break;
			}
		//Charge
		case 1:
			{
			nspec_charge_shot_charge++;
			
			//Cancel at full charge
			if (nspec_charge_shot_charge >= 180)
				{
				//Store charge
				if (on_ground())
					{
					attack_stop(PLAYER_STATE.idle);
					}
				else
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			
			//Cancels
			if (cancel_charge_check()) return;
			
			//Shoot
			if (button(INPUT.special, buff))
				{
				attack_phase = 2;
				attack_frame = 8;
				}
			break;
			}
		//Shoot
		case 2:
			{
			if (attack_frame == 0)
				{
				hsp -= facing * 2;
				if (!on_ground())
					{
					set_speed(0, -1, true, true);
					}
				var _scale = 0.5 + (nspec_charge_shot_charge / 180) * 1.5;
				var proj = custom_projectile
					(
					obj_nspec_charge_shot, 
					30, 
					0, 
					0.35 * _scale, 
					0.35 * _scale, 
					round(8 * _scale), 
					4.5 * _scale, 
					0.45 * _scale, 
					45, 
					120, 
					HITBOX_SHAPE.circle, 
					6 * _scale, 
					0,
					FLIPPER.sakurai
					);
				proj.base_hitlag = 4 * _scale;
				proj.hit_sfx = snd_hit_explosion2;
				proj.overlay_scale = _scale;
				audio_play_sound(snd_hit_shot, 10, false);
				attack_phase++;
				attack_frame = 24;
				nspec_charge_shot_charge = 0;
				}
			break;
			}
		//Finish
		case 3:
			{
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_();