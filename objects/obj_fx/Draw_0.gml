/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	var _alpha = fade ? lerp(0, image_alpha, lifespan / total_life) : image_alpha;
	draw_sprite_ext(fx_index, fx_frame, floor(x), floor(y), fx_xs, fx_ys, fx_ang, image_blend, _alpha);
	if (game_surface_enable) surface_reset_target();
	}