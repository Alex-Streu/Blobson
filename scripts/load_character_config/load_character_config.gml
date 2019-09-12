///@func load_character_config()
var _characters = profile[? "Characters"];
var _configs = profile[? "Configs"];
if (_characters == undefined) { config = _configs[| 0]; return; }

var _config = _characters[? character.name];
if (_config == undefined) { config = _configs[| 0]; return; }

for (var i = 0; i < ds_list_size(_configs); i++)
{
	var _curr = _configs[| i];
	if (_curr[? "ID"] == _config)
	{
		config = _curr;
		return;
	}
}

config = _configs[| 0];