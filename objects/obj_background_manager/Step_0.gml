/// @description MOVE BACKGROUNDS
//Loop through the layers of the background and apply speeds
for(var i=0;i<array_length_1d(background);i++)
	{
	var _layer = background[i];
	
	if (_layer[BACK.sprite] != back_clear)
		{
		_layer[@BACK.x] += _layer[BACK.xspd];
		_layer[@BACK.y] += _layer[BACK.yspd];
		
		if (_layer[@BACK.x] > obj_game.cam_w)
			{
			_layer[@BACK.x] = -sprite_get_width(_layer[BACK.sprite]) * _layer[BACK.scale];
			}
		if (_layer[@BACK.x] < -sprite_get_width(_layer[BACK.sprite]) * _layer[BACK.scale])
			{
			_layer[@BACK.x] = obj_game.cam_w;
			}
		if (_layer[@BACK.y] > obj_game.cam_h)
			{
			_layer[@BACK.y] = -sprite_get_height(_layer[BACK.sprite] * _layer[BACK.scale]);
			}
		if (_layer[@BACK.y] < -sprite_get_height(_layer[BACK.sprite]) * _layer[BACK.scale])
			{
			_layer[@BACK.y] = obj_game.cam_h;
			}
		}
	}