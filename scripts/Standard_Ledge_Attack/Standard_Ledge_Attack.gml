///Standard_Ledge_Attack
//Contains the standard actions for the ledge attack state.
var run = true;
//Timer
ledge_attack_frame=max(--ledge_attack_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeA"];
anim_speed=ani_speed_ledgegetup;
#endregion
#region Invincible
set_invulnerable(INV.invincible,1);
#endregion
#region No speed
set_speed(0,0,false,false);
#endregion
#region End Getup
if (ledge_attack_frame==0)
	{
	//Snap to getup position
	if (!place_meeting(x+ledge_attack_finish_x*facing,y+ledge_attack_finish_y,obj_solid))
		{
		x += ledge_attack_finish_x * facing;
		y += ledge_attack_finish_y;
		}
	attack_start(my_attacks[?"LedgeA"]);
	}
#endregion