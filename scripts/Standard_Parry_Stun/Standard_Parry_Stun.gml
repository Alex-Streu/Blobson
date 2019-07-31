///Standard_Parry_Stun
//Contains the standard actions for the parry stun state.
var run=true;
//Timer
parry_stun_frame=max(--parry_stun_frame,0);
#region Friction and Gravity
if (on_ground())
	{
	friction_gravity(ground_friction);
	}
else
	{
	friction_gravity(air_friction,grav,max_fall_speed);
	}
#endregion
#region Animation
if (on_ground())
	{
	anim_sprite=my_sprites[?"ParryS"];
	}
else
	{
	anim_sprite=my_sprites[?"Tumble"];
	}
anim_speed=anim_speed_normal;
#endregion
#region When the lag is done
if (run && parry_stun_frame==0)
	{
	//Return to idle state
	set_state(PLAYER_STATE.idle);
	run=false;
	}
#endregion
#region Friction / Gravity
friction_gravity(hard_landing_friction,grav,max_fall_speed);
#endregion
move_();