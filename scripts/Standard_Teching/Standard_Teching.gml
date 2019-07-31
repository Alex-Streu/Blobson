///Standard_Teching
//Contains the standard actions for the teching state.
var run=true;
//Timer
teching_frame=max(--teching_frame,0);
#region Transition through phases of teching
switch(teching_phase)
	{
	case 0:
		{
		//No speed
		set_speed(0,0,false,false);
		set_invulnerable(INV.type_invincible,teching_frame);
		
		//Animation
anim_sprite=my_sprites[?"Tech"];
anim_speed = ani_speed_tech;

		
		
		if (teching_frame==0)
			{
			//Next phase
			teching_phase++;
			teching_frame=tech_endlag;
			}
		break;
		}
	case 1:
		{
		if (run && teching_frame==0)
			{
			teching_phase=0;
			//Back to Idle State
			set_state(PLAYER_STATE.idle);
			run=false;
			}
		break;
		}
	default: break;
	}
#endregion
//No movement