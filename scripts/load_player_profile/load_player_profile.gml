///@func load_player_profile(id)
///@param id

var arg = 0;
var _id = argument[arg++];

var _profile = global.profiles[| _id];
var _configs = _profile[? "Configs"];

if (_profile[? "IsDefault"])
{
	_profile[? "Name"] = name;
}

profile = _profile;
config = _configs[| 0];