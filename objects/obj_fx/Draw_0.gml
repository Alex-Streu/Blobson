/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	draw_sprite_ext(fx_index,fx_frame,floor(x),floor(y),fx_xs,fx_ys,fx_ang,image_blend,image_alpha);
	if (game_surface_enable) surface_reset_target();
	}