///@func Layer_Fade_End()
if (instance_exists(obj_background_manager))
	{
	shader_reset();
	}
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_reset_target();
	}