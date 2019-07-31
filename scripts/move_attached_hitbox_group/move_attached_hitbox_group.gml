///@func move_attached_hitbox_group(group_number,hitbox_list,relative_x,relative_y)
///@param group_number
///@param hitbox_list
///@param relative_x
///@param relative_y
//Moves all hitboxes within the given group relative to their positions.
//It also moves the hitboxes' "my_xstart" and "my_ystart" so the hitboxes don't snap back to the player
//Loop through all hitbox instances
var _list = argument[1];
for(var i = 0; i < ds_list_size(_list); i++)
	{
	var _hitbox = _list[|i];
	if (_hitbox.hitbox_group == argument[0])
		{
		with(_hitbox)
			{
			x += argument[2];
			y += argument[3];
			owner_xstart -= argument[2];
			owner_ystart -= argument[3];
			}
		}
	}
	
/*
with(obj_attached_hitbox)
	{
	if (hitbox_group==argument0 && owner==argument1)
		{
		x+=argument2;
		y+=argument3;
		owner_xstart+=argument2;
		owner_xstart+=argument3;
		}
	}
//*/