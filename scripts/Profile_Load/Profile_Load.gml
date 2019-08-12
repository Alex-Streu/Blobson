///@func Profile_Load(name)
///@param name
///@desc Opens up the standard save file and returns the map for the certain key
var _name = argument[0],
	_file = file_exists(profiles_save) ? profiles_save : "default_profile.sav";

var _save_map = json_decode(load_string_file(_file));
if (ds_map_exists(_save_map,_name))
	{
	var _map = ds_map_create();
	ds_map_copy(_map,_save_map[? _name]);
	//Delete the map
	ds_map_destroy(_save_map);
	return _map;
	}
else
	{
	ds_map_destroy(_save_map);
	}
	
return undefined;