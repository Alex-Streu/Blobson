///@func Player_Move_To_Front()
if (instance_exists(obj_player_renderer))
	{
	ds_list_value_to_end(obj_player_renderer.player_depth_list, id);
	}