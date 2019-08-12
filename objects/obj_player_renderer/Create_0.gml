/// @description Draw order list
//Player depth list
player_depth_list = ds_list_create();

with(obj_player)
	{
	ds_list_add(other.player_depth_list, id);
	}