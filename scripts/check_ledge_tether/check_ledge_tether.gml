///@func check_ledge_tether(distance)
///@desc Allows the player to tether to a distant ledge (read conditions listed below)
///@param distance
var _dist = argument[0];
if (instance_number(obj_ledge) > 0)
	{
	if (ledge_grab_timeout == 0)
		{
		var _nearest = instance_nearest(x,y,obj_ledge);
	
		/*
		Ledge tether conditions:
			The player cannot be on the opposite side of the ledge
			The bottom of the player must be below the ledge
			The player must be close enough to the ledge
			The player must be facing the ledge
		*/
	
		if (sign(_nearest.x-x) != -_nearest.ledge_direction && 
			bbox_bottom > _nearest.y &&
			distance_to_point(_nearest.x,_nearest.y) < _dist &&
			facing == _nearest.ledge_direction)
			{
			set_state(PLAYER_STATE.ledge_tether);
			ledge_id = _nearest;
			ledge_tether_frame=ledge_tether_snap_time;
			facing = _nearest.ledge_direction;
			return true;
			}
		}
	}
return false;