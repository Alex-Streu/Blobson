/// @description
#region Input - accept from all controllers
var _start = false, _button = false, _save = false;
for(var i = 0; i < number_of_devices; i++)
	{
	if (gamepad_button_check_pressed(i, gp_start)) _start = true;
	if (gamepad_button_check_pressed(i, gp_face2)) _button = true;
	if (gamepad_button_check_pressed(i, gp_face3)) _save = true;
	if (keyboard_check_pressed(vk_enter)) _start = true;
	if (keyboard_check_pressed(vk_backspace)) _save = true;
	}
#endregion	

if (_start || _button) room_goto(rm_Custom_Controls);

//Offset
offset = lerp(offset, 0, 0.05);
if (offset <= 0.05)
	{
	offset = 0;
	}

//Save replay
if (!global.replay_mode && global.replay_record && can_save_replay)
	{
	if (_save)
		{	
		can_save_replay = false;
		var _time = global.replay_data[? "TIME"];
		Replay_Save(version + "/" + "Replay " + _time + ".pfe");
		}
	}