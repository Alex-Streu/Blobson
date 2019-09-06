/// @description Load players
if (global.load_players)
{
	global.load_players = false;
	var _players = [];
	for (var i = 0; i < array_length_1d(players); i++)
	{
		var _p = players[i];
		if (!_p[? "IsActive"]) { continue; }
		
		with (obj_player_spawn)
		{
			var _num = _p[? "Number"];
			if (player == _num)
			{
				var _obj = instance_create_layer(x, y-1, "GameLayer", obj_player);
				with (_obj)
				{
					//Assign character
					script_execute(_p[? "Character"]);
					
					//Assign controller
					controller = real(global.device_number[_num]);
					player_number = _num;
					player_color = _num + 1; //Offset for palettes
					
					//Assign custom controls
					if (controller >= 0)
					{
						Custom_Controls_Load(cc, player_number);
					}
					else
					{
						Custom_Controls_Load(cc, 0);
						is_AI = true;
					}
				}
				
				_players[_num] = _obj;
			}
		}
	}

	//DELETE ME
	//---------------------------------------
	if (array_length_1d(_players) < 2)
	{
		with (obj_player2_spawn)
		{
			var _obj = instance_create_layer(x, y-1, "GameLayer", obj_player);
			with (_obj)
			{
				script_execute(scr_sarina);
				Custom_Controls_Load(cc, 0);
				is_AI = true;
			}
			_players[array_length_1d(_players)] = _obj;
		}
	}
	//---------------------------------------
	
	instance_create_layer(0, 0, "GameLayer", obj_game);
	instance_create_layer(0, 0, "GameLayer", obj_player_renderer);
	
	with (obj_game) { players = _players; }
}