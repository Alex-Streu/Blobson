///Standard_Magnetized
//Contains the standard actions for the magnetized state.
var run = true;
//Timer
magnet_frame=max(--magnet_frame,0);
#region Animation
anim_sprite = choose(my_sprites[?"Hitlag"  ],my_sprites[?"Hitlag2"  ],my_sprites[?"Hitlag3"  ],my_sprites[?"Hitlag4"  ]);
anim_speed=0;
#endregion
#region End Phase
if (magnet_frame==0)
	{
	set_state(PLAYER_STATE.aerial);
	run = false;
	}
#endregion
#region Move toward magnet goal
if (run)
	{
	set_speed_towards_point(magnet_goal_x,magnet_goal_y,magnetbox_snap_speed);
	/*
	set_speed
		(
		clamp(magnet_goal_x-x,-magnetbox_snap_speed,magnetbox_snap_speed),
		clamp(magnet_goal_y-y,-magnetbox_snap_speed,magnetbox_snap_speed),
		false,false
		);
	*/
	}
#endregion
move_();