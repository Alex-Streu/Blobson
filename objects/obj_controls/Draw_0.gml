/// @description
draw_set_font(fnt_consolas);
draw_set_valign(fa_top);
draw_set_color(c_black);
var s, col;
s = "";
col = c_white;
for(var i = 0; i < max_players; i++)
	{
	//Controller Port Number
	var _controller = global.device_number[i];
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x + (i * 200) + 100, y - 16, "Controller: " + string(_controller));
	draw_set_halign(fa_left);
	for(var m = 0; m < array_height_2d(button_array); m++)
		{
		//The current selection has a highlight
		if (cursor[i] == m)
			{
			draw_set_color($666666);
			draw_set_alpha(0.7);
			draw_rectangle(x + 4 + (i * 200), y + (m * 16), x + 200 + (i * 200), y + (m * 16) + 16, false);
			draw_set_alpha(1);
			}
		//Draw the button
		var desc = _controller > -1 ? string_lower(gamepad_get_description(_controller)) : "xbox";
		var button_name = button_names_by_device[? "Xbox"];
		if (string_count("nintendo", desc) > 0) { button_name = button_names_by_device[? "Nintendo"]; }
		col = make_color_hsv((m / array_height_2d(button_array)) * 255, 255, 255);
		draw_text_color(x + 8 + (i * 200), y + m * 16, string(button_name[m]), col, col, col, col, 1);
		col = make_color_hsv((button_array[m, i + 1] / 8) * 255, 230, 255);
		//Draw what it is assigned to
		switch(button_array[@ m, i + 1])
			{
			case INPUT.attack:	s = "Attack"; break;
			case INPUT.special: s = "Special"; break;
			case INPUT.jump:	s = "Jump"; break;
			case INPUT.shield:	s = "Shield"; break;
			case INPUT.grab:	s = "Grab"; break;
			case INPUT.smash:	s = "Smash"; break;
			case INPUT.taunt:	s = "Taunt"; break;
			case INPUT.pause:	s = "Pause"; break;
			default:			s = "---"; break;
			}
		draw_text_color(x + 96 + (i * 200), y + m * 16, string(s), col, col, col, col, 1);
		}
	}