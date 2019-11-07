///@func load_default_config()
var _config = noone;
var _configs = profile[? "Configs"];

for (var i = 0; i < ds_list_size(_configs); i++)
{
	var _val = _configs[| i];
	if (_val[? "IsDefault"])
	{
		_config = _val;
		break;
	}
}

if (_config == noone) { _config = _configs[| 0]; }

load_player_config(_config);