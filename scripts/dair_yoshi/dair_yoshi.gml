//Down Aerial
/*
- Multihit spiking move
- Has a hitbox when landing
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame, 0);
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_try();
aerial_drift();
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_dair_yoshi;
			anim_speed = 0;
			anim_frame = 0;
		
			landing_lag = 20;
			set_speed(0, -1, true, true);
			attack_frame = 10;
			return;
			}
		//Startup
		case 0:
			{
			//Animation
			if (attack_frame == 7)
				anim_frame = 1;
			if (attack_frame == 2)
				anim_frame = 2;
				
			if (attack_frame == 0)
				{
				attack_phase++;
				attack_frame = 16;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Hitbox loop
			if (attack_frame % 2 == 0 && attack_frame != 0)
				{
				//Animation
				anim_frame++;
				if (anim_frame > 6)
					anim_frame = 3;
				
				reset_hitbox_groups();
				create_melee( 25, 30, 0.3, 0.4, 2, 3, 0.1, 2, 240, 1, HITBOX_SHAPE.circle, 0);
				create_melee(-25, 30, 0.3, 0.4, 2, 3, 0.1, 2, 300, 1, HITBOX_SHAPE.circle, 0);
				create_melee(  0, 28, 0.5, 0.7, 2, 3, 0.1, 2, 270, 1, HITBOX_SHAPE.circle, 0);
				}
			//Ground Cancel
			if (on_ground())
				{
				//Animation
				anim_frame = 2;
				
				attack_phase = 3;
				attack_frame = 12;
				destroy_all_attached_hitboxes(my_hitboxes);
				create_melee(0, 10, 0.6, 0.4, 2, 10, 0.3, 4, 45, 3, HITBOX_SHAPE.rectangle, 1, FLIPPER.sakurai);
				//VFX
				fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				}
			//Final Hit
			else if (attack_frame == 0)
				{
				//Animation
				anim_frame = 7;
			
				attack_phase = 2;
				attack_frame = 20;
				//Draw in opponent for final hit
				var _hitbox = create_magnetbox(0, 30, 0.5, 0.5, 0, 1, hsp * 4 * facing, 40, 10, 1, HITBOX_SHAPE.rectangle, 1);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_weak);
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 18)
				anim_frame = 8;
			if (attack_frame == 12)
				anim_frame = 10;
			if (attack_frame == 6)
				anim_frame = 11;
			
			//Ground Cancel
			if (on_ground())
				{
				//Animation
				anim_frame = 2;
				
				attack_phase = 3;
				attack_frame = 12;
				destroy_all_attached_hitboxes(my_hitboxes);
				create_melee(0, 10, 0.6, 0.4, 2, 10, 0.3, 4, 45, 3, HITBOX_SHAPE.rectangle, 2, FLIPPER.sakurai);
				//VFX
				fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				}
			else if (attack_frame == 14)
				{
				//Animation
				anim_frame = 9;
				
				create_melee(0, 30, 0.6, 0.7, 6, 6, 0.7, 10, 45, 2, HITBOX_SHAPE.rectangle, 2);
				}
			else if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		//Grounded Finish
		case 3:
			{
			friction_gravity(1, grav, max_fall_speed);
			//Animation
			if (attack_frame == 5)
				anim_frame = 11;
			
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