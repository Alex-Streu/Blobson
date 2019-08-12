///@func Profile_Save(profile_map,name)
///@param profile_map
///@param name
///@desc Opens up the standard save file and replaces the map value for the certain key
var _profile_map = argument[0],
	_name = argument[1],
	_file = file_exists(profiles_save) ? profiles_save : "default_profile.sav";
	
var _save_map = json_decode(load_string_file(_file));
if (ds_map_exists(_save_map,_name))
	{
	//Replace the old profile map with the newer one
	ds_map_delete(_save_map,_name);
	ds_map_add_map(_save_map,_name,_profile_map);
	//Resave map
	save_string_file(_file,json_encode(_save_map));
	}
//Delete the map
ds_map_destroy(_save_map);