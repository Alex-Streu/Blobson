///Standard_Shield_Break
//Contains the standard actions for the shield break state.
var run=true;
//Timer
shield_break_frame=max(--shield_break_frame,0);
#region Speeds
set_speed(0,0,false,true);
friction_gravity(0,grav,max_fall_speed);
#endregion
#region Animation and invulnerability
if (on_ground())
	{
	set_invulnerable(INV.type_normal,0);
	anim_sprite=my_sprites[?"ShieldB"];
	anim_speed=0.4;
	}
else
	{
	set_invulnerable(INV.type_invincible,1);
	anim_sprite=my_sprites[?"Tumble"];
	anim_speed=anim_speed_normal;
	}
#endregion
#region When the lag is done
if (run && shield_break_frame==0)
	{
	//Return to idle state
	set_state(PLAYER_STATE.idle);
	run=false;
	}
#endregion
move_();