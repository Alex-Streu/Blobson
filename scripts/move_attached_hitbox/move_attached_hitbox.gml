///@func move_attached_hitbox(hitbox_id,relative_x,relative_y)
///@param hitbox_id
///@param relative_x
///@param relative_y
//Moves the attached hitbox with the given ID relative to it's position
//It also moves the hitbox's "my_xstart" and "my_ystart" so the hitbox doesn't snap back to the player
if (instance_exists(argument[0]))
	{
	//Target the hitbox
	with(argument[0])
		{
		x += argument[1];
		y += argument[2];
		owner_xstart -= argument[1];
		owner_ystart -= argument[2];
		}
	}