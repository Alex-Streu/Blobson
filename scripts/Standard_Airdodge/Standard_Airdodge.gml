///Standard_Airdodge
//Contains the standard actions for the airdodge state.
var run = true;
//Timer
air_dodge_frame = max(--air_dodge_frame, 0);
#region Animation
anim_sprite = my_sprites[?"Airdodge"];
anim_speed = ani_speed_airdodge;
//anim_frame = 0;
#endregion
#region Transition through phases
switch(air_dodge_phase)
	{
	case 0:
		{
		if (air_dodge_frame == 0)
			{
			air_dodge_phase++;
			air_dodge_frame = air_dodge_active;
			//Invulnerability
			set_invulnerable(INV.invincible, air_dodge_active);
			#region Waveland
			if (run && check_waveland())
				{
				run = false;
				//Reset invulnerability
				set_invulnerable(INV.normal, 0);
				}
			#endregion
			}
		break;
		}
	case 1:
		{
		if (air_dodge_frame == 0)
			{
			air_dodge_phase++;
			air_dodge_frame = air_dodge_endlag;
			}
		move_();
		#region Waveland
		if (run && check_waveland())
			{
			run = false;
			//Reset invulnerability
			set_invulnerable(INV.normal, 0);
			}
		#endregion
		break;
		}
	case 2:
		{
		//No movement in endlag
		set_speed(0, 0, false, false);
		if (air_dodge_frame == 0)
			{
			air_dodge_phase = 0;
			//Change state
			anim_speed = ani_speed_jump
		    anim_sprite = my_sprites[?"Fall"];
			set_state(PLAYER_STATE.aerial);
			return;
			}
		break;
		}
	default: break;
	}
#endregion
//No movement