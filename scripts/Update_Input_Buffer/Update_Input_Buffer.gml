///@func Update_Input_Buffer(buffer_index,keyboard,count)
///@param buffer_index
///@param keyboard
///@param count
///Can only be called by players
var _buffer, _cc, _keyboard, _count;
_buffer = argument[0];
_cc = cc;
_keyboard = argument[1];
_count = argument[2];
//Update input buffer
#region Input Buffer Count
if (_count)
	{
	//Counts for each input
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		_buffer[| i] = min(++_buffer[| i], max_buffer_length);
		}
	}
#endregion
#region Keyboard
if (_keyboard)
	{
	//Buttons
	if keyboard_check_pressed(ord("S")) _buffer[| _cc[0]] = 0;
	if keyboard_check(ord("S")) _buffer[| _cc[0] + INPUT.length] = 0;   
	if keyboard_check_pressed(ord("A")) _buffer[| _cc[1]] = 0;
	if keyboard_check(ord("A")) _buffer[| _cc[1] + INPUT.length] = 0;	   
	if keyboard_check_pressed(ord("D")) _buffer[| _cc[2]] = 0;
	if keyboard_check(ord("D")) _buffer[| _cc[2] + INPUT.length] = 0;		   
	if keyboard_check_pressed(ord("F")) _buffer[| _cc[3]] = 0;
	if keyboard_check(ord("F")) _buffer[| _cc[3] + INPUT.length] = 0;		   
	//Back buttons									   
	if keyboard_check_pressed(ord("Z")) _buffer[| _cc[4]] = 0;
	if keyboard_check(ord("Z")) _buffer[| _cc[4] + INPUT.length] = 0;
	if keyboard_check_pressed(ord("X")) _buffer[| _cc[5]] = 0;
	if keyboard_check(ord("X")) _buffer[| _cc[5] + INPUT.length] = 0;   
	if keyboard_check_pressed(ord("C")) _buffer[| _cc[6]] = 0;
	if keyboard_check(ord("C")) _buffer[| _cc[6] + INPUT.length] = 0;    
	if keyboard_check_pressed(ord("V")) _buffer[| _cc[7]] = 0;
	if keyboard_check(ord("V")) _buffer[| _cc[7] + INPUT.length] = 0;   
	//Pausing										    
	if keyboard_check_pressed(vk_enter) _buffer[| _cc[8]] = 0;
	if keyboard_check(vk_enter) _buffer[| _cc[8] + INPUT.length] = 0;	    
	if keyboard_check_pressed(vk_shift) _buffer[| _cc[9]] = 0;
	if keyboard_check(vk_shift) _buffer[| _cc[9] + INPUT.length] = 0;    
	//Dpad											    
	if keyboard_check_pressed(ord("G")) _buffer[| _cc[10]] = 0;
	if keyboard_check(ord("G")) _buffer[| _cc[10] + INPUT.length] = 0;
	//Rstick - replicate a "pressed" function
	//Cache Stick Values
	Stick_Cache_Values(Rstick, keyboard_check(ord("L")) - keyboard_check(ord("J")), keyboard_check(ord("K")) - keyboard_check(ord("I")), _count);
	var _dist = stick_get_distance(Rstick);
	if (_dist > rstick_flick_amount &&
		stick_get_speed(Rstick) > rstick_flick_speed)
		{
		_buffer[| _cc[11]] = 0;
		control_flicked_r = 0;
		}
	if (_dist > rstick_tilt_amount)
		{
		_buffer[| _cc[11] + INPUT.length] = 0;
		control_tilted_r = 0;
		}
	//Lstick - same as rstick
	//Cache Stick Values
	Stick_Cache_Values(Lstick, keyboard_check(vk_right) - keyboard_check(vk_left), keyboard_check(vk_down) - keyboard_check(vk_up), _count);
	var _dist = stick_get_distance(Lstick);
	if (_dist > stick_flick_amount &&
		stick_get_speed(Lstick) > stick_flick_speed)
		{
		control_flicked_l = 0;
		}
	if (_dist > stick_tilt_amount)
		{
		control_tilted_l = 0;
		}
	}
#endregion 
#region Controller
else
	{
	//Buttons
	if (gamepad_button_check_pressed(controller, gp_face1)) _buffer[| _cc[0]] = 0;
	if (gamepad_button_check(controller, gp_face1)) _buffer[| _cc[0] + INPUT.length] = 0;
	if (gamepad_button_check_pressed(controller, gp_face2)) _buffer[| _cc[1]] = 0;
	if (gamepad_button_check(controller, gp_face2)) _buffer[| _cc[1] + INPUT.length] = 0;	      
	if (gamepad_button_check_pressed(controller, gp_face3)) _buffer[| _cc[2]] = 0;
	if (gamepad_button_check(controller, gp_face3)) _buffer[| _cc[2] + INPUT.length] = 0;	      
	if (gamepad_button_check_pressed(controller, gp_face4)) _buffer[| _cc[3]] = 0;
	if (gamepad_button_check(controller, gp_face4)) _buffer[| _cc[3] + INPUT.length] = 0;
	
	//Back buttons
	if (gamepad_button_check_pressed(controller, gp_shoulderl)) _buffer[| _cc[4]] = 0;
	if (gamepad_button_check(controller, gp_shoulderl)) _buffer[| _cc[4] + INPUT.length] = 0;
	if (gamepad_button_check_pressed(controller, gp_shoulderr)) _buffer[| _cc[5]] = 0;
	if (gamepad_button_check(controller, gp_shoulderr)) _buffer[| _cc[5] + INPUT.length] = 0;
	if (gamepad_button_check_pressed(controller, gp_shoulderlb)) _buffer[| _cc[6]] = 0;
	if (gamepad_button_check(controller, gp_shoulderlb)) _buffer[| _cc[6] + INPUT.length] = 0;
	if (gamepad_button_check_pressed(controller, gp_shoulderrb)) _buffer[| _cc[7]] = 0;
	if (gamepad_button_check(controller, gp_shoulderrb)) _buffer[| _cc[7] + INPUT.length] = 0;
	
	//Pausing
	if (gamepad_button_check_pressed(controller, gp_start)) _buffer[| _cc[8]] = 0;
	if (gamepad_button_check(controller, gp_start)) _buffer[| _cc[8] + INPUT.length] = 0;
	if (gamepad_button_check_pressed(controller, gp_select)) _buffer[| _cc[9]] = 0;
	if (gamepad_button_check(controller, gp_select)) _buffer[| _cc[9] + INPUT.length] = 0;
	
	//Dpad
	if (gamepad_button_check_pressed(controller, gp_padd)) _buffer[| _cc[10]] = 0;
	if (gamepad_button_check(controller, gp_padd)) _buffer[| _cc[10] + INPUT.length] = 0;
	
	//Rstick - replicate a "pressed" function
	//Cache Stick Values
	Stick_Cache_Values(Rstick, gamepad_axis_rounded(controller, gp_axisrh), gamepad_axis_rounded(controller, gp_axisrv), _count);
	var _dist = stick_get_distance(Rstick);
	if (_dist > rstick_flick_amount &&
		stick_get_speed(Rstick) > rstick_flick_speed)
		{
		_buffer[| _cc[11]] = 0;
		control_flicked_r = 0;
		}
	if (_dist > rstick_tilt_amount)
		{
		_buffer[| _cc[11] + INPUT.length] = 0;
		control_tilted_r = 0;
		}
	
	//Lstick - same as rstick
	//Cache Stick Values
	Stick_Cache_Values(Lstick, gamepad_axis_rounded(controller, gp_axislh), gamepad_axis_rounded(controller, gp_axislv), _count);
	var _dist = stick_get_distance(Lstick);
	if (_dist > stick_flick_amount &&
		stick_get_speed(Lstick) > stick_flick_speed)
		{
		control_flicked_l = 0;
		}
	if (_dist > stick_tilt_amount)
		{
		control_tilted_l = 0;
		}
	}
#endregion