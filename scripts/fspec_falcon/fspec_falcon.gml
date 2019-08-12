//Forward Special
/*
- Rushes ahead until an opponent is hit, then attacks
- The grounded move hits upwards; the aerial move hits downwards
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_fspec_falcon;
			anim_frame = 0;
			anim_speed = 0;
		
			//Move backwards
			change_facing();
			set_speed(-3 * facing, 0, false, false);
			attack_frame = 10;
			return;
			}
		//Startup
		case 0:
			{
			//Animation
			if (attack_frame == 6)
				anim_frame = 1;
			if (attack_frame == 3)
				anim_frame = 2;
			
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 3;
				
				attack_frame = 15;
				attack_phase++;
				//VFX
				var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
				_fx.fx_xs = 2 * facing;
				}
			break;
			}
		//Rush
		case 1:
			{
			if check_ledge_grab() return;
			//Animation
			if (attack_frame == 14)
				anim_frame = 4;
			if (attack_frame < 14 && attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame > 8)
					{
					anim_frame = 5;
					}
				}
			
			set_speed(13 * facing, 0, false, false);
			//If the opponent is hit, auto attack
			if (collision_circle_list(x + (30 * facing), y, 10, obj_player, false, true, global.col_list, false))
				{
				for(var i = 0; i < ds_list_size(global.col_list); i++)
					{
					if (is_alive(global.col_list[|i]))
						{
						if (on_ground())
							{
							//Animation
							anim_frame = 9;
							
							attack_phase = 2;
							attack_frame = 18;
							set_invulnerable(INV.superarmor, 7);
							}
						else
							{
							//Animation
							anim_frame = 14;
							
							set_speed(facing, -4, false, true);
							attack_phase = 3;
							attack_frame = 13;
							set_invulnerable(INV.superarmor, 5);
							}
						break;
						}
					}
				ds_list_clear(global.col_list);
				}
			else
			//End attack in a failure
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 19;
				
				set_speed(4 * facing, -1, false, false);
				attack_phase = 4;
				attack_frame = 28;
				}
			break;
			}
		//Grounded Hit
		case 2:
			{
			set_speed(0, 0, false, false);
			//Animation
			if (attack_frame == 17)
				anim_frame = 10;
			if (attack_frame == 11)
				anim_frame = 12;
			if (attack_frame == 5)
				anim_frame = 13;
			
			if (attack_frame == 16)
				{
				//Animation
				anim_frame = 11;
				
				var _hitbox = create_melee(38, -20, 0.5, 1, 9, 12, 0.3, 14, 80, 3, HITBOX_SHAPE.circle, 0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
				create_melee(4, -10, 0.3, 0.5, 9, 12, 0.3, 4, 80, 3, HITBOX_SHAPE.circle, 0);
				}
		
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		//Aerial Hit
		case 3:
			{
			//Animation
			if (attack_frame == 8)
				anim_frame = 16;
			if (attack_frame == 6)
				anim_frame = 17;
			if (attack_frame == 2)
				anim_frame = 18;
			
			if (attack_frame == 11)
				{
				//Animation
				anim_frame = 15;
				
				var _hitbox = create_melee(30, 8, 0.5, 1, 9, 9, 0.7, 14, 300, 3, HITBOX_SHAPE.circle, 0);
				set_hitbox_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong2);
				create_melee(4, 4, 0.3, 0.5, 9, 9, 0.7, 14, 300, 3, HITBOX_SHAPE.circle, 0);
				}
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		//No attack finish
		case 4:
			{
			//Animation
			if (attack_frame == 25)
				anim_frame = 20;
			if (attack_frame == 20)
				anim_frame = 21;
			if (attack_frame == 15)
				anim_frame = 22;
			if (attack_frame == 10)
				anim_frame = 23;
			
			if (on_ground())
				{
				friction_gravity(ground_friction, grav, max_fall_speed);
				}
			else
				{
				if check_ledge_grab() return;
				friction_gravity(air_friction, grav, max_fall_speed);
				}
			if (attack_frame == 0)
				{
				if (on_ground())
					{
					attack_stop(PLAYER_STATE.idle);
					}
				else
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				}
			break;
			}
		}
	}
//Movement
if (on_ground())
	{
	move_grounded_();
	}
else
	{
	move_();
	}