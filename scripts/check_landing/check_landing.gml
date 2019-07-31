///@func check_landing()
///@desc Transition to idle state when landing on platforms or solid blocks
//If you are not holding down on the control stick
if (!stick_tilted(Lstick,DIR.down))
	{
	//If there is a block below you and you're not IN a platform and you are falling / still
	if (on_ground() && vsp>=0)
		{
		//Stop speed and change state
		vsp=0;
		vsp_frac=0;
		set_state(PLAYER_STATE.idle);
		//VFX
		create_fx(spr_dust_land,1,0,30,x,y,2,0);
		return true;
		}
	}
else
	{
	//If there is a solid block below you and you are falling / still
	if (on_solid(x,y) && vsp>=0)
		{
		//Stop speed and change state
		vsp=0;
		vsp_frac=0;
		set_state(PLAYER_STATE.idle);
		//VFX
		create_fx(spr_dust_land,1,0,30,x,y,2,0);
		return true;
		}
	}
return false;