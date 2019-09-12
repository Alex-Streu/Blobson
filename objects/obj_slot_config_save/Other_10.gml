/// @description Click event

// Inherit the parent event
event_inherited();

var _text = field.textString;
var _found = false;
var _profile = ds_list_find_value(global.profiles, owner.profile[? "Index"]);
var _configs = _profile[? "Configs"];
var _size = ds_list_size(_configs);

for (var i = 0; i < _size; i++)
{
	var _config = _configs[| i];
	if (_config[? "Name"] == _text && !_config[? "IsDefault"]) { _found = true; break; }
}

if (_found) 
{ 
	var _alert = instance_create_layer(x, y, "AlertLayer", obj_slot_alert);
	_alert.owner = owner;
	_alert.text = stringify("The config\n'{0}'\nalready exists!", field.textString);
	_alert.alarm[0] = alertLength; 
	return; 
}
show_debug_message(_text)

var _max =  _configs[| _size-1];
var _config = ds_map_create();
_config[? "ID"] = _max[? "ID"] + 1;
_config[? "Name"] = _text;
_config[? "IsDefault"] = false;
_config[? "Index"] = ds_list_size(_configs);

ds_list_add(_profile[? "Configs"], _config);
ds_list_mark_as_map(_profile[? "Configs"], _config[? "Index"]);
ds_list_mark_as_map(global.profiles, _profile[? "Index"]);

save_profiles();

with (owner) 
{ 
	load_player_config(_config);
	update_slot_menu(); 
	update_slot_menu(); 
}