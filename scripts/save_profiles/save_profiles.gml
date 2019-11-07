///@func save_profiles()

var _profiles = ds_map_create();
var _list = ds_list_create();
ds_list_copy(_list, global.profiles);
for (var i = 0; i < ds_list_size(_list); i++)
{
	var _p = _list[| i];
	if (_p[? "IsDefault"])
	{
		ds_list_delete(_list, i);
		break;
	}
}
ds_map_add_list(_profiles, "Profiles", _list);

save_string_file(player_profiles_sav, json_encode(_profiles));