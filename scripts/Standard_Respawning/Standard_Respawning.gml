///Standard_Respawning
//Contains the standard actions for the respawning state.
var run = true;
//Timer
respawn_frame=max(--respawn_frame,0);
#region Animation
anim_sprite=my_sprites[?"Idle"];
anim_speed= ani_speed_idle;
#endregion
#region Renew resources
double_jumps=max_double_jumps;
air_dodges=1;
#endregion
#region Invulnerability
set_invulnerable(INV.invincible,1);
#endregion
#region Autocancel
if (run && respawn_frame==0)
	{
	//Aerial State
	set_state(PLAYER_STATE.aerial);
	set_invulnerable(INV.invincible,respawning_invulnerable_time);
	invulnerable_override=false;
	run = false;
	}
#endregion
#region Manual Cancel
if (run && stick_tilted(Lstick))
	{
	set_state(PLAYER_STATE.aerial);
	set_invulnerable(INV.invincible,respawning_invulnerable_time);
	invulnerable_override=false;
	run = false;
	}
#endregion
//No movement