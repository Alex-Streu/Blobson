///Standard_Is_Grabbed
//Contains the standard actions for the is_grabbed state.
var run = true;
#region Animation
anim_sprite=my_sprites[?"Hitstun"];
anim_speed=anim_speed_normal;
#endregion
#region Snap to the grabbing player's position
if (run)
	{
	if (grab_hold_id != noone)
		{
		set_speed_towards_point
			(
			grab_hold_id.x + grab_hold_x,
			grab_hold_id.y + grab_hold_y,
			grab_snap_speed
			);
		/*
		set_speed
			(
			clamp((grab_hold_id.x+grab_hold_x)-x,-grab_snap_speed,grab_snap_speed),
			clamp((grab_hold_id.y+grab_hold_y)-y,-grab_snap_speed,grab_snap_speed),
			false,false
			);
		*/
		}
	}
#endregion
#region Release
//If the opposing player is no longer grabbing or throwing, break out of the grab
if (grab_hold_id != noone && 
	grab_hold_id.state != PLAYER_STATE.grabbing && 
	grab_hold_id.state != PLAYER_STATE.attacking)
	{
	grab_hold_id.damage += grab_release_damage;
	grab_release_held();
	}
#endregion
//Movement
move_();