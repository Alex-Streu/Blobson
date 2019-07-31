///Standard_Ledge_Jump
//Contains the standard actions for the ledge jump state.
var run=true;
//Timer
ledge_jump_frame=max(--ledge_jump_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeJ"];
anim_speed=ani_speed_ledge_jump;
#endregion
#region Invincible
set_invulnerable(INV.type_invincible,1);
#endregion
#region No speed
set_speed(0,0,false,false);
#endregion
#region End Getup
if (ledge_jump_frame==0)
	{
	//Snap to getup position
	if (!place_meeting(x+ledge_jump_finish_x*facing,y+ledge_jump_finish_y,obj_solid))
		{
		x += ledge_jump_finish_x * facing;
		y += ledge_jump_finish_y;
		}
	set_speed(ledge_jump_hsp * facing,-ledge_jump_vsp,false,false);
	set_state(PLAYER_STATE.aerial);
	}
#endregion