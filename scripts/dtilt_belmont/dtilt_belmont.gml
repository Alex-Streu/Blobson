//Down Tilt for character0
/*
- Press the attack button during the slide to do the jump kick
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
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
			anim_sprite = spr_dtilt_belmont;
			anim_frame = 0;
			anim_speed = 0;
		
			attack_frame = 3;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 1;
			
				attack_phase++;
				attack_frame = 18;
				set_speed(12 * facing, 0, false, false);
				create_melee(10, 18, 0.5, 0.4, 4, 9, 0.6, 15, 75, 3, HITBOX_SHAPE.rectangle, 0);
				//VFX
				var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				_fx.fx_xs = 2 * facing;
				}
			//Movement
			move_grounded_();
			break;
			}
		//Active
		case 1:
			{
			//Animation
			if (attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame > 4)
					{
					anim_frame = 1;
					}
				}
				
			if (attack_frame == 15)
				{
				create_melee(10, 18, 0.5, 0.4, 3, 8, 0.5, 15, 75, 12, HITBOX_SHAPE.rectangle, 0);
				}
			//Second part
			if (button(INPUT.attack, buff))
				{
				//Animation
				anim_frame = 8;
				
				attack_phase = 3;
				attack_frame = 30;
				set_speed(10 * facing, -7, false, false);
				destroy_all_attached_hitboxes(my_hitboxes);
				break;
				}
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 5;
				
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 4 : 17;
				}
			//Movement
			move_grounded_();
			break;
			}
		//Grounded finish
		case 2:
			{
			//Animation
			if (attack_frame == 16)
				anim_frame++;
			if (attack_frame == 10)
				anim_frame++;
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.crouching);
				}
			//Movement
			move_grounded_();
			break;
			}
		//Aerial active
		case 3:
			{
			if (attack_frame == 28)
				{
				//Animation
				anim_frame = 9;
				
				create_melee(10, 4, 0.5, 0.4, 5, 8, 0.9, 15, 45, 2, HITBOX_SHAPE.circle, 1);
				}
			if (attack_frame == 26)
				{
				//Animation
				anim_frame = 10;
				create_melee(10, 6, 0.5, 0.4, 5, 6, 0.9, 15, 45, 12, HITBOX_SHAPE.circle, 1);
				}
				
			//Animation
			if (attack_frame == 22)
				anim_frame = 11;
			if (attack_frame == 19)
				anim_frame = 12;
			if (attack_frame == 16)
				anim_frame = 13;
			if (attack_frame == 13)
				anim_frame = 14;
			if (attack_frame == 10)
				anim_frame = 15;
			if (attack_frame == 5)
				anim_frame = 16;
				
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			//Movement
			move_();
			break;
			}
		}
	}
	
//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}