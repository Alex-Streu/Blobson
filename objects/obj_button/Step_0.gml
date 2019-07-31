/// @description
if (mouse_check_button_pressed(mb_left) &&
	point_in_rectangle(mouse_x, mouse_y, x, y, x + image_xscale * 32, y + image_yscale * 32))
	{
	ripple_effect_create(system, mouse_x, mouse_y, 50, 400, c_white, c_white, 0.5, 0, 30, false);
	
	if (text == "PLAY")
		{
		room_goto_next();
		}
	}
ripple_system_step(system,1);