/// @description Draw name and highlight
draw_self();

//Draw name
if (profile != noone)
{
	draw_set_color(c_white);
	draw_set_font(global.base_font);
	draw_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(profile[? "Name"]), 0.1, 0.1, 0);
}

//Draw highlight
draw_highlight();