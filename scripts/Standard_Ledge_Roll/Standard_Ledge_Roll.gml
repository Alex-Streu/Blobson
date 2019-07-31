///Standard_Ledge_Roll
//Contains the standard actions for the ledge roll state.
var run=true;
//Timer
ledge_roll_frame=max(--ledge_roll_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeR"];
anim_speed=anim_speed_normal;
#endregion
#region Invincible
//Set the invincibility to last through the roll's startup so it is completely safe
set_invulnerable(INV.type_invincible,roll_startup);
#endregion
#region No speed
set_speed(0,0,false,false);
#endregion
#region End Getup
if (ledge_roll_frame==0)
	{
	//Snap to getup position
	if (!place_meeting(x+ledge_roll_finish_x*facing,y+ledge_roll_finish_y,obj_solid))
		{
		x += ledge_roll_finish_x * facing;
		y += ledge_roll_finish_y;
		}
	set_state(PLAYER_STATE.rolling);
	//Set the rolling direction to match the ledge facing direction
	rolling_direction=facing;
	}
#endregion