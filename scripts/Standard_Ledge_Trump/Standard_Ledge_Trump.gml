///Standard_Ledge_Trump
//Contains the standard actions for the ledge trump state.
var run = true;
//Timer
ledge_trump_frame = max(--ledge_trump_frame, 0);
#region Friction / Gravity
friction_gravity(air_friction, grav, max_fall_speed);
#endregion
#region Animation
anim_sprite = my_sprites[?"LedgeTr"];
anim_speed = anim_speed_normal;
#endregion
#region When the lag is done
if (run && ledge_trump_frame == 0)
	{
	//Return to aerial state
	set_state(PLAYER_STATE.aerial);
	run = false;
	}
#endregion
move_();