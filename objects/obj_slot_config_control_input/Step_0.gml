/// @description Record input
event_inherited();

if (!recording) { return; }
if (!ready) { ready = true; return; }

var _input = noone;
with (owner)
{
	for (var i = 0; i < array_length_1d(global.button_map); i++)
	{
		if (gamepad_button_check_pressed(controller, global.button_map[i]))
		{
			_input = global.button_map[i];
		}
	}
}

if (_input == gp_start) 
{
	owner.holdingComplete = true;
	recording = false;
	ready = false;
	return;
}

if (_input != noone && ds_list_find_index(setting, _input) == -1) 
{ 
	ds_list_add(setting, _input); 	
	if (ds_list_size(setting) > inputCap) { ds_list_delete(setting, 0); }
}