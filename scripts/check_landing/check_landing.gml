///@func check_landing()
///@desc Transition to lag state when landing on platforms or solid blocks
//If you are not holding down on the control stick
if (!stick_tilted(Lstick, DIR.down))
	{
	//If there is a block below you and you're not in a platform and you are falling / still
	if (on_ground() && vsp >= 0)
		{
		//Stop speed and change state
		vsp = 0;
		vsp_frac = 0;
		anim_frame = 0;
		set_state(PLAYER_STATE.in_lag);
		lag_frame = land_time;		
		
		#region Ensure recovery special are restored and useable
        akuma_fspecial_ready = true;
        akuma_uspecial_ready = true;
        #endregion
		
		//VFX
		fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		return true;
		}
	}
else
	{
	//If there is a solid block below you and you are falling / still
	if (on_solid(x, y) && vsp >= 0)
		{
		//Stop speed and change state
		vsp = 0;
		vsp_frac = 0;
		set_state(PLAYER_STATE.in_lag);
		lag_frame = land_time;
		//VFX
		fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		return true;
		}
	}
return false;