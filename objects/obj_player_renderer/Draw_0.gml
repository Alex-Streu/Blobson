/// @description
for(var i = 0; i < ds_list_size(player_depth_list); i++)
	{
	var _player = player_depth_list[| i];
	with(_player)
		{
		event_perform(ev_other, event_draw);
		}
	}