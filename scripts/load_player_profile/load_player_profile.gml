///@func load_player_profile(profile)
///@param profile

var arg = 0;
var _qProfile = argument[arg++];

var _profile = global.profiles[| ds_list_find_index(global.profiles, _qProfile)];
var _configs = _profile[? "Configs"];

if (_profile[? "IsDefault"])
{
	_profile[? "Name"] = name;
}

profile = _profile;
config = _configs[| 0];