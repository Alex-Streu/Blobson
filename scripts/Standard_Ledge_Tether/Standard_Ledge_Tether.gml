///Standard_Ledge_Tether
//Contains the standard actions for the ledge snap state.
var run=true;
//Timer
ledge_tether_frame=max(--ledge_tether_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeT"];
anim_speed=anim_speed_normal;
anim_frame=0;
#endregion
#region Move toward the ledge
if (run)
	{
	//Invincible
	set_invulnerable(INV.type_invincible,1);
	//set_speed_towards_point(ledge_id.x,ledge_id.y,ledge_tether_snap_speed);
	set_speed_towards_point_accel
		(
		ledge_id.x + (ledge_hang_relative_x * facing),
		ledge_id.y + (ledge_hang_relative_y),
		2,
		ledge_tether_snap_speed
		);
	}
#endregion
#region Go to a ledge snap when the timer is done or if you reach the ledge
if (ledge_tether_frame==0 || 
	(x==ledge_id.x+(ledge_hang_relative_x*facing) && y==ledge_id.y+(ledge_hang_relative_y)))
	{
	//Snap to the ledge
	x = ledge_id.x + (ledge_hang_relative_x * facing);
	y = ledge_id.y + (ledge_hang_relative_y);
	
	run=false;
	set_state(PLAYER_STATE.ledge_snap);
	ledge_snap_frame=ledge_snap_time;
	//ledge_hang_frame = 0; //The ledge hang frames counts up rather than down
	//create_fx(spr_shine_ledge_grab,1,0,11,ledge_id.x,ledge_id.y,2,irandom(360));
	}
#endregion
move_();