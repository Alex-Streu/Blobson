///@func delete_profile(profile)
///@param profile
var _profile = argument[0];

ds_list_delete(global.profiles, ds_list_find_index(global.profiles, _profile));

//Update indexes
for (var i = _profile[? "Index"]; i < ds_list_size(global.profiles); i++)
{
	var _p = global.profiles[| i];
	_p[? "Index"] = i;
}

save_profiles();

if (profile == _profile)
{
	load_default_profile();
}