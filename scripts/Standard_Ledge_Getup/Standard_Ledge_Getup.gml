///Standard_Ledge_Getup
//Contains the standard actions for the ledge getup state.
var run = true;
//Timer
ledge_getup_frame=max(--ledge_getup_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeG"];
anim_speed=anim_speed_normal;
#endregion
#region Invincible
set_invulnerable(INV.invincible,1);
#endregion
#region No speed
set_speed(0,0,false,false);
#endregion
#region End Getup
if (ledge_getup_frame==0)
	{
	//Snap to getup position
	if (!place_meeting(x+ledge_getup_finish_x*facing,y+ledge_getup_finish_y,obj_solid))
		{
		x += ledge_getup_finish_x * facing;
		y += ledge_getup_finish_y;
		}
	set_state(PLAYER_STATE.idle);
	}
#endregion