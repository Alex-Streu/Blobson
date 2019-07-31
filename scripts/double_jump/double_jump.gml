///@func double_jump()
///@desc Executes a mid air jump, including the horizontal speed boost
vsp=-double_jump_speed;
vsp_frac=0;
double_jumps--;
//Horizontal Speed change
if (stick_tilted(Lstick))
	{
	hsp=abs(hsp)*sign(stick_value(Lstick,DIR.horizontal));
	hsp_frac=0;
	}
//State
set_state(PLAYER_STATE.aerial);
//VFX
create_fx(spr_dust_air_jump,1,0,14,x,y,2,0);