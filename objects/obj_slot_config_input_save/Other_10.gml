/// @description Click event

// Inherit the parent event
event_inherited();

//Convert field input to setting
with (field)
{
	setting = [];
	for (var i = 0; i < ds_list_size(input); i++)
	{
		setting[i] = input[| i];
	}
}

//Get config
var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _configs = _profile[? "Configs"];
var _config = ds_list_find_value(_configs, owner.config[? "Index"]);

//Update config setting
_config[? field.name] = field.setting;

//Save
save_profiles();

with (owner) 
{ 
	load_player_config(_config);
	update_slot_menu();
}