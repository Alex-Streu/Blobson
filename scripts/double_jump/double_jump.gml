///@func double_jump()
///@desc Executes a mid air jump, including the horizontal speed boost
vsp = -double_jump_speed;
vsp_frac = 0;
double_jumps--;
jump_is_dash_jump = false;
jump_is_midair_jump = true;
//Horizontal Speed change
if (stick_tilted(Lstick))
	{
	hsp = min(abs(hsp), max_air_speed) * sign(stick_get_value(Lstick, DIR.horizontal));
	hsp_frac = 0;
	}
//State
set_state(PLAYER_STATE.aerial);
//VFX
fx_create(spr_dust_air_jump, 1, 0, 14, x, y, 2, 0);