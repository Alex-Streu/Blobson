///@func delete_config(config)
///@param config
var _config = argument[0];

var _configs = profile[? "Configs"];
ds_list_delete(_configs, ds_list_find_index(profile[? "Configs"], _config));

//Update indexes
for (var i = _config[? "Index"]; i < ds_list_size(_configs); i++)
{
	var _c = _configs[| i];
	_c[? "Index"] = i;
}

save_profiles();

if (config == _config)
{
	load_default_config();
}