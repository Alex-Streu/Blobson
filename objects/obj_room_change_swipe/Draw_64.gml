///Draw Rectangle
var _w=display_get_gui_width();
var _h=display_get_gui_height();
draw_set_color($2f2f2f);
if(state==FadeState.Out)
{
	draw_rectangle(lerp(_w,-1,scale),
								-1,
								display_get_gui_width(),
								display_get_gui_height(),
								false);
}
else
{
	draw_rectangle(-1,
								-1,
								lerp(-1,_w,scale),
								display_get_gui_height(),
								false);
}
draw_sprite_ext(spr_logo,0,room_width-150,150,1,1,0,c_white,1);
