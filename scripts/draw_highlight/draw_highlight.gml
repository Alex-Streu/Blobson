///@func draw_highlight
if (isHovered)
{
	draw_set_alpha(0.4);
	draw_set_color(c_white);
	draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
	
	//Reset draw
	reset_draw();
}