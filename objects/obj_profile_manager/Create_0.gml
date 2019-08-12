/// @description Load in all profiles
all_profiles = ds_list_create();
profile_surfs = ds_list_create();
clear_surfs = [];

var _file = file_exists(profiles_save) ? profiles_save : "default_profile.sav";
var _profile_map = json_decode(load_string_file(_file));

//Extract profiles from the map
show_debug_message(ds_map_size(_profile_map));
var _key = ds_map_find_first(_profile_map);
do
	{
	var _profile = ds_map_create();
	ds_map_copy(_profile,_profile_map[? _key]);
	ds_list_add(all_profiles,_profile);
	ds_list_mark_as_map(all_profiles,ds_list_size(all_profiles)-1);
	_key = ds_map_find_next(_profile_map,_key);
	}
until(is_undefined(_key))
	
//Destroy map
ds_map_destroy(_profile_map);

//Init surfaces
width = 200;
height = 320;
for(var i=0;i<ds_list_size(all_profiles);i++)
	{
	ds_list_add(profile_surfs,surface_create(width,height));
	clear_surfs[i] = true;
	}