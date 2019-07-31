///Standard_Ledge_Hang
//Contains the standard actions for the ledge hang state.
var run=true;
//Timer
ledge_hang_frame=min(++ledge_hang_frame,ledge_hang_max_time);
#region Animation
anim_sprite=my_sprites[?"Ledge"];
anim_speed=anim_speed_normal;
anim_frame=0;
#endregion
#region Renew resources
double_jumps=max_double_jumps;
air_dodges=1;
#endregion
#region No speed
set_speed(0,0,false,false);
#endregion
#region Ledge Options
if (ledge_hang_frame > ledge_hang_min_time)
	{
	#region Ledge Drift Away
	if (run &&
		(sign(stick_value(Lstick,DIR.horizontal)) != facing &&
		stick_tilted(Lstick,DIR.horizontal)))
		{
		run=false;
		set_state(PLAYER_STATE.aerial);
		set_invulnerable(INV.type_normal,0);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	#region Ledge Fall
	if (run && stick_tilted(Lstick,DIR.down))
		{
		run=false;
		set_state(PLAYER_STATE.aerial);
		set_invulnerable(INV.type_normal,0);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	#region Ledge Jump
	if (run && (button(INPUT.jump,buff) || stick_tilted(Lstick,DIR.up)))
		{
		run=false;
		set_state(PLAYER_STATE.ledge_jump);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	#region Ledge Roll
	if (run && button(INPUT.shield,buff))
		{
		run=false;
		set_state(PLAYER_STATE.ledge_roll);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	#region Ledge Getup
	if (run && 
		(sign(stick_value(Lstick,DIR.horizontal)) == facing &&
		stick_tilted(Lstick,DIR.horizontal)))
		{
		run=false;
		set_state(PLAYER_STATE.ledge_getup);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	#region Ledge Attack
	if (run && (button(INPUT.attack,buff)))
		{
		run=false;
		set_state(PLAYER_STATE.ledge_attack);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	}
if (ledge_hang_frame == ledge_hang_max_time)
	{
	#region Ledge Fall
	if (run)
		{
		run=false;
		set_speed(0,1,false,false);
		set_state(PLAYER_STATE.aerial);
		set_invulnerable(INV.type_normal,0);
		//Cannot instantly regrab the ledge
		ledge_grab_timeout=ledge_grab_timeout_standard;
		}
	#endregion
	}
#endregion
move_();