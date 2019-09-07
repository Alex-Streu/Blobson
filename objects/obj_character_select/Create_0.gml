//Create player manager
if (!instance_exists(obj_player_manager)) { instance_create_layer(0, 0, "GameLayer", obj_player_manager); }

//Setup characters
character_select_init();

rowSize = 6;

var _offsetY = y;
var _offsetX = 50;
var _space = 10;

//Create icon objects
for (var i = 0; i < array_length_1d(characters); i++) {
	var _c = characters[i];
	if (!_c[? "IsUnlocked"]) { continue; }
	
	_space = 50 + sprite_get_width(_c[? "Icon"]);
	create_character_select_item(_c[? "Name"], _c[? "Script"], _c[? "Icon"], _c[? "Portrait"],
								_offsetX + _space*(i%rowSize), _offsetY + _space*floor(i/rowSize));
}

//---------------------------
//Setup profiles
var profiles = ds_list_create();

if (!file_exists(player_profiles_sav))
{	
	var _config = ds_map_create();
	_config[? "ID"] = 0;
	_config[? "Name"] = "DEF";
	_config[? "IsDefault"] = true;
	_config[? "Index"] = 0;
	
	var _configs = ds_list_create();
	_configs[| 0] = _config;
	
	
	var _default = ds_map_create();
	_default[? "ID"] = 0;
	_default[? "Name"] = "DEFAULT";
	_default[? "IsDefault"] = true;
	_default[? "Configs"] = _configs;
	_default[? "Index"] = 0;
	
	profiles[| 0] = _default;
	
	// DELETE ME
	var _config = ds_map_create();
	_config[? "ID"] = 1;
	_config[? "Name"] = "HVY";
	_config[? "IsDefault"] = false;
	_config[? "Index"] = 0;
	
	var _configs = ds_list_create();
	_configs[| 0] = _config;
	
	
	_default = ds_map_create();
	_default[? "ID"] = 1;
	_default[? "Name"] = "Kaboose";
	_default[? "IsDefault"] = false;
	_default[? "Configs"] = _configs;
	_default[? "Index"] = 1;
	
	profiles[| 1] = _default;
	
	
	var _config = ds_map_create();
	_config[? "ID"] = 2;
	_config[? "Name"] = "LIT";
	_config[? "IsDefault"] = false;
	_config[? "Index"] = 0;
	
	var _configs = ds_list_create();
	_configs[| 0] = _config;
	
	
	_default = ds_map_create();
	_default[? "ID"] = 2;
	_default[? "Name"] = "Dr N";
	_default[? "IsDefault"] = false;
	_default[? "Configs"] = _configs;
	_default[? "Index"] = 2;
	
	profiles[| 2] = _default;
	
	//save_string_file(player_profiles_sav, json_encode(profiles));
}
else
{
	profiles = json_decode(load_string_file(player_profiles_sav));
}

global.profiles = profiles;



//--------------------------
//Setup players

_offsetY = 32;
_offsetX = 50;
_space = 220;

//Create player slot objects
for (var i = 0; i < array_length_1d(players); i++)
{
	var _p = players[i];
	
	create_character_select_player(_p[? "Number"], _p[? "Name"], _p[? "Color"], _p[? "Marker"], 
									_p[? "SlotSprite"], _p[? "CursorSprite"]);
	
	pm_add_player(_p);
}