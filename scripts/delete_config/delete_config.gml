///@func delete_config(config)
///@param config
var _config = argument[0];

ds_list_delete(profile[? "Configs"], ds_list_find_index(profile[? "Configs"], _config));

save_profiles();

if (config == _config)
{
	load_default_config();
}