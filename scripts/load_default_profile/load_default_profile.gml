///@func load_default_profile()
var _profile = noone;

for (var i = 0; i < ds_list_size(global.profiles); i++)
{
	var _val = global.profiles[| i];
	if (_val[? "IsDefault"] == true)
	{
		_profile = _val;
		break;
	}
}

if (_profile == noone) { _profile = global.profiles[| 0]; }

load_player_profile(_profile);