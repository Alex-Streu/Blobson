///Standard_Techrolling
//Contains the standard actions for the tech rolling state.
var run=true;
//Timer
techrolling_frame=max(--techrolling_frame,0);
//Animation is in the phases
#region Transition through phases of rolling
switch(techrolling_phase)
	{
	case 0:
		{
		//Animation
		anim_sprite=my_sprites[?"Techroll"];
		anim_speed=0;
		anim_frame=0;
		//No speed
		set_speed(0,0,false,false);
		set_invulnerable(INV.type_invincible,techroll_active+1);
		if (techrolling_frame==0)
			{
			//Next phase
			techrolling_phase++;
			techrolling_frame=techroll_active;
			}
		break;
		}
	case 1:
		{
		//Animation
		anim_speed = ani_speed_techroll;
		//No speed
		set_speed(0,0,false,false);
		roll_move(32,techroll_speed,techrolling_direction);
		if (techrolling_frame==0)
			{
			techrolling_phase++;
			techrolling_frame=techroll_endlag;
			}
		break;
		}
	case 2:
		{
		//Animation
		anim_speed=0;
		if (run && techrolling_frame==0)
			{
			//Position the player to be backwards
			if (techrolling_direction!=0)
				{
				facing=-sign(techrolling_direction);
				}
			techrolling_phase=0;
			//Back to Idle State
			set_state(PLAYER_STATE.idle);
			run=false;
			}
		break;
		}
	default: break;
	}
#endregion