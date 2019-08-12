/// @description UPDATE
var xx, yy;
for(var i = 0; i < max_players; i++)
	{
	//Navigate the menu
	var _controller = global.device_number[i];
	if (_controller != -1)
		{
		xx = gamepad_axis_value(_controller, gp_axislh);
		yy = gamepad_axis_value(_controller, gp_axislv);
		//Changes custom controls based on stick values
		if (abs(yy) > stick_tilt_amount)
			{
			if (!yPress[i])
				{
				yPress[i] = true;
				cursor[i] += sign(yy);
				cursor[i] = clamp(cursor[i], 0, array_height_2d(button_array) - 1);
				}
			}
		else
			{
			yPress[i] = false;
			}
		if (abs(xx) > stick_flick_amount)
			{
			if (!xPress[i])
				{
				xPress[i] = true;
				button_array[@ cursor[i], i + 1] += sign(xx);
				button_array[@ cursor[i], i + 1] = clamp(button_array[@ cursor[i], i + 1], -1, 8);
				}
			}
		else
			{
			xPress[i] = false;
			}
		//If Start is pressed, reset controls
		if (gamepad_button_check_pressed(_controller, gp_face2))
			{
			//Reset
			Custom_Controls_Reset(button_array, i);
			}
		//Start the game
		if (gamepad_button_check_pressed(_controller, gp_start))
			{
			global.replay_mode = false;
			//Save things
			Custom_Controls_Save(button_array);
			room_goto(rm_Character_Select);
			break;
			}
		//Play a replay
		if (gamepad_button_check_pressed(_controller, gp_face1))
			{
			//Select replay
			var _name = get_string("Enter the file name of the replay you want to load:", "");
			var _file = (version + "/" + _name + ".pfe");
			if (file_exists(_file))
				{
				global.replay_mode = true;
				Replay_Load(_file);
				room_goto_next();
				}
			else
				{
				global.replay_mode = false;
				}
			break;
			}
		}
	//Keyboard
	//Start the game
	if (keyboard_check_pressed(vk_enter))
		{
		global.device_number[0] = 0;
		
		global.replay_mode = false;
		//Save things
		Custom_Controls_Save(button_array);
		room_goto_next();
		break;
		}
	//Play a replay
	if (keyboard_check_pressed(vk_backspace))
		{
		//Select replay
		var _name = get_string("Enter the file name of the replay you want to load:", "");
		var _file = (version + "/" + _name + ".pfe");
		if (file_exists(_file))
			{
			global.replay_mode = true;
			Replay_Load(_file);
			room_goto_next();
			}
		else
			{
			global.replay_mode = false;
			}
		break;
		}
	}