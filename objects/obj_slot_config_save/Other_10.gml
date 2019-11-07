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

var _max =  _configs[| _size-1];
var _config = ds_map_create();
_config[? "ID"] = _max[? "ID"] + 1;
_config[? "Name"] = _text;
_config[? "IsDefault"] = false;
_config[? "Index"] = ds_list_size(_configs);

var _settings = ds_map_create();
ds_map_copy(_settings, global.default_config[? "Settings"]);
ds_map_add_map(_config, "Settings", _settings);

//Set character config
var _characters = ds_map_create();
if (_profile[? "Characters"] != undefined) { _characters = _profile[? "Characters"]; }
_characters[? owner.character.name] = _config[? "ID"];
ds_map_add_map(_profile, "Characters", _characters);


//Save
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