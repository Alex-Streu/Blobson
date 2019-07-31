///Standard_Ledge_Snap
//Contains the standard actions for the ledge snap state.
var run=true;
//Timer
ledge_snap_frame=max(--ledge_snap_frame,0);
#region Animation
anim_sprite=my_sprites[?"LedgeS"];
anim_speed=anim_speed_normal;
anim_frame=0;
#endregion
#region Move toward the ledge
if (run)
	{
	set_speed_towards_point
		(
		ledge_id.x + (ledge_hang_relative_x * facing),
		ledge_id.y + (ledge_hang_relative_y),
		ledge_snap_speed
		);
	/*
	set_speed
		(
		clamp(ledge_id.x-x+(ledge_hang_relative_x*facing),-ledge_snap_speed,ledge_snap_speed),
		clamp(ledge_id.y-y+ledge_hang_relative_y,-ledge_snap_speed,ledge_snap_speed),
		false,false
		);
	*/
	}
#endregion
#region Exit the state when the timer is done
if (ledge_snap_frame==0)
	{
	//Snap to the ledge
	x = ledge_id.x + (ledge_hang_relative_x * facing);
	y = ledge_id.y + (ledge_hang_relative_y);
	
	run=false;
	set_state(PLAYER_STATE.ledge_hang);
	ledge_hang_frame = 0; //The ledge hang frames counts up rather than down
	create_fx(spr_shine_ledge_grab,1,0,11,ledge_id.x,ledge_id.y,2,irandom(360));
	}
#endregion
move_();