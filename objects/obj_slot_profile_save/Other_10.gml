/// @description Click event

// Inherit the parent event
event_inherited();

var _text = field.textString;
var _found = false;
var _size = ds_list_size(global.profiles);

for (var i = 0; i < _size; i++)
{
	var profile = global.profiles[| i];
	if (profile[? "Name"] == _text && !profile[? "IsDefault"]) { _found = true; break; }
}

if (_found) 
{ 
	var _alert = instance_create_layer(x, y, "AlertLayer", obj_slot_alert);
	_alert.owner = owner;
	_alert.text = stringify("The profile\n'{0}'\nalready exists!", field.textString);
	_alert.alarm[0] = alertLength; 
	return; 
}

var _max =  global.profiles[| _size-1];
var _profile = ds_map_create();
_profile[? "ID"] = _max[? "ID"] + 1;
_profile[? "Name"] = _text;
_profile[? "IsDefault"] = false;
_profile[? "Index"] = ds_list_size(global.profiles);
ds_map_add_list(_profile, "Configs", ds_list_create());
ds_list_copy(_profile[? "Configs"], global.default_config_list);

ds_list_add(global.profiles, _profile);
ds_list_mark_as_map(global.profiles, _size);

save_profiles();

with (owner) 
{ 
	load_player_profile(global.profiles[| _profile[? "Index"]]);
	update_slot_menu(); 
	update_slot_menu(); 
}