///@func destroy_all_attached_hitboxes(hitbox_list)
///@param hitbox_list
//Destroys all of the attached hitboxes
var _list = argument[0];
while(!ds_list_empty(_list))
	{
	//Instances remove themselves automatically
	instance_destroy(_list[|0]);
	}
	
/*
with(obj_attached_hitbox)
	{
	if (owner==argument0)
		{
		instance_destroy();
		}
	}
//*/