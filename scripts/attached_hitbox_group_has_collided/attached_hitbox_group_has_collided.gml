///@func attached_hitbox_group_has_collided(group,hitbox_list)
///@desc Checks if any hitbox in the group has collided
///@param group
///@param hitbox_list
//Loop through all attached hitbox instances
var _list = argument[1];
for(var i = 0; i < ds_list_size(_list); i++)
	{
	var _hitbox = _list[|i];
	if (_hitbox.hitbox_group == argument[0] && _hitbox.has_hit)
		{
		return true;
		}
	}

/*
with(obj_attached_hitbox)
	{
	if (hitbox_group==argument[0] && owner==other.id && has_hit)
		{
		return true;
		}
	}
return false;
//*/