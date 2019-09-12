/// @description Click event

// Inherit the parent event
event_inherited();

//Set character config
var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _characters = ds_map_create();
if (_profile[? "Characters"] != undefined) { _characters = _profile[? "Characters"]; }
_characters[? owner.character.name] = config[? "ID"];
ds_map_add_map(_profile, "Characters", _characters);

save_profiles();

var _val = config;
with (owner)
{
	load_player_config(_val);
	update_slot_menu();
}