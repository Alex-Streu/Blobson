/// @description Record input
event_inherited();

#region Convert setting to list
if (!inputReady)
{
	for (var i = 0; i < array_length_1d(setting); i++)
	{
		input[| i] = setting[i];
	}
	
	inputReady = true;
}
#endregion

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

if (_input != noone && ds_list_find_index(input, _input) == -1) 
{ 
	ds_list_add(input, _input); 	
	if (ds_list_size(input) > inputCap) { ds_list_delete(input, 0); }
}