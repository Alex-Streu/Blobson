/// @description Load players
if (global.load_players)
{
	global.load_players = false;
	var _playerCount = 0;
	for (var i = 0; i < array_length_1d(players); i++)
	{
		var _p = players[i];
		if (!_p[? "IsActive"]) { continue; }
		
		_playerCount++;
		
		with (obj_player_spawn)
		{
			var _num = _p[? "Number"];
			if (player == _num)
			{
				var _obj = instance_create_layer(x, y, "GameLayer", obj_player);
				with (_obj)
				{
					script_execute(_p[? "Character"]);
					//loaded = true;
				}
			}
		}
	}

	//DELETE ME
	if (_playerCount < 2)
	{
		with (obj_player2_spawn)
		{
			var _obj = instance_create_layer(x, y, "GameLayer", obj_player);
			with (_obj)
			{
				script_execute(scr_matsu);
				loaded = true;
			}
		}
	}
	
	instance_create_layer(0, 0, "GameLayer", obj_game);
	instance_create_layer(0, 0, "GameLayer", obj_player_renderer);
	
	//Assign_Controllers();
	//Assign_Custom_Controls();
}