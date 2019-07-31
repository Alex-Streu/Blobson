/// @description
var w = sprite_width;
var h = sprite_height;
if (surface_exists(surf))
	{
	surface_set_target(surf);
	draw_clear_alpha(c_white,0);
	draw_sprite_ext(sprite_index,image_index,0,0,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	surface_reset_target();
	ripple_system_draw(surf,system);
	draw_surface(surf,x,y);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_menu);
	draw_text(x + w / 2, y + h / 2, text);
	}
else
	{
	surf = surface_create(w, h);
	}