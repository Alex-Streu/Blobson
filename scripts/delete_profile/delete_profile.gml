///@func delete_profile(profile)
///@param profile
var _profile = argument[0];

ds_list_delete(global.profiles, ds_list_find_index(global.profiles, _profile));

if (profile == _profile)
{
	load_default_profile();
}