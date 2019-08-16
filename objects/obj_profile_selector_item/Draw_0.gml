/// @description Draw name and highlight

draw_self();

//Draw highlight
if (isHovered)
{
	draw_set_alpha(0.4);
	draw_set_color(c_white);
	draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
	
	//Reset draw
	draw_set_alpha(1);
	draw_set_color(c_white);
}

//Draw name
draw_set_color(c_white);
draw_set_font(global.base_font);
draw_text_transformed(x+sprite_width/2, y+sprite_height-(sprite_height/2), string_upper(values[? "Name"]), 0.15, 0.15, 0);