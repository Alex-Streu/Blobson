///Standard_Ledge_Snap
//Contains the standard actions for the ledge snap state.
var run = true;
//Timer
ledge_snap_frame = max(--ledge_snap_frame, 0);
#region Animation
anim_sprite = my_sprites[?"LedgeS"];
anim_speed = ani_speed_ledgesnap;
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
	}
#endregion
#region Exit the state when the timer is done
if (ledge_snap_frame == 0)
	{
	//Snap to the ledge
	x = ledge_id.x + (ledge_hang_relative_x * facing);
	y = ledge_id.y + (ledge_hang_relative_y);
	
	run = false;
	set_state(PLAYER_STATE.ledge_hang);
	ledge_hang_frame = 0; //The ledge hang frames counts up rather than down
	#region Ledge Trump
	//All of the other players grabbing the same ledge get trumped
	if (ledge_trump_enable)
		{
		with(obj_player)
			{
			if (id == other.id) continue;
			//Check ledge and state
			if (ledge_id == other.ledge_id && state == PLAYER_STATE.ledge_hang)
				{
				set_state(PLAYER_STATE.ledge_trump);
				hsp = ledge_trump_hsp * facing;
				vsp = ledge_trump_vsp;
				ledge_trump_frame = ledge_trump_stun_time;
				}
			}
		}
	#endregion
	//VFX
	fx_create(spr_shine_ledge_grab, 1, 0, 9, ledge_id.x, ledge_id.y, 2, irandom(360));
	}
#endregion
move_();