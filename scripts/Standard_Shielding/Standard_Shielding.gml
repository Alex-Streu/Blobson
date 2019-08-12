///Standard_Shielding
//Contains the standard actions for the shielding state.
var run = true;
friction_gravity(ground_friction,grav,max_fall_speed);
#region Animation
anim_sprite=my_sprites[?"Shield"];
anim_speed=anim_speed_normal;
#endregion
#region Change to aerial state
if run && check_aerial() run = false;
#endregion
#region Check shield type
//Check for shield type
switch(shield_type)
	{
	case SHIELD.melee:
		{
		//Shield Frame Timer - You can't release shield if the min-time isn't up
		//Getting the shield hit adds additional time you can't release the shield
		shield_frame = max(--shield_frame, 0);
		//Shield Health
		shield_hp -= shield_depeletion_rate;
		//Shield Stun
		shield_stun = max(--shield_stun, 0);
		if (run && shield_stun == 0)
			{
			//Shield Release
			if run && shield_frame == 0 && !button_hold(INPUT.shield, 1)
				{
				set_state(PLAYER_STATE.idle);
				run = false;
				}
			//Wavedash Cancel
			if (shield_into_wavedash	&& 
				run						&& 
				shield_frame > 0		&& 
				button(INPUT.jump, buff)&& 
				check_airdodge())
				{
				run = false;
				}
			//Jump Cancel - Reset the input from the buffer so it doesn't waveland cancel
			if run && check_jump()
				{
				button_reset(INPUT.shield);
				//Crouch jumping
				if (stick_tilted(Lstick, DIR.down) && scs_crouch_jump)
					{
					jump_is_shorthop = true;
					}
				run = false;
				}
			//Rolling Cancel
			if run && check_rolling() run = false;
			//Spot Dodge
			if run && check_spot_dodge() run = false;
			//Shield Platform Drop (Special platform drop)
			if (run && 
				stick_get_value(Lstick, DIR.down) > shield_plat_drop_amount &&
				stick_get_speed(Lstick) > shield_plat_drop_speed)
				{
				//If there's a platform under you but not a solid
				if (!on_solid(x, y) && on_plat(x, y))
					{
					//Move a pixel down so gravity will take effect
					if (!place_meeting(x, y + 1, obj_solid))
						{
						y += 1;
						}
					set_state(PLAYER_STATE.aerial);
					//Set variable to restrict fastfalling
					can_fastfall = false;
					}
				run = false;
				}
			//Shield Shifting
			if (run)
				{
				var _stick = Choose_Stick_By_Input(INPUT.shield);
				var _amount = (stick_get_distance(_stick) * shield_shift_amount);
				shield_shift_x = lengthdir_x(_amount, stick_get_direction(_stick));
				shield_shift_y = lengthdir_y(_amount, stick_get_direction(_stick));
				}
			}
		//Invulnerability
		set_invulnerable(INV.shielding, 1);
		//Shield Break
		if (run && shield_hp <= 0)
			{
			shield_hp = shield_break_reset_hp;
			set_state(PLAYER_STATE.shield_break);
			shield_break_frame = shield_break_base_time + (damage * shield_break_multiplier);
			set_speed(0, -shield_break_speed, true, false);
			run = false;
			}
		break;
		}
	//Parry (different state)
	case SHIELD.rivals:
		{
		break;
		}
	//Ultimate
	case SHIELD.ultimate:
		{
		break;
		}
	default: break;
	}
#endregion
move_grounded_();