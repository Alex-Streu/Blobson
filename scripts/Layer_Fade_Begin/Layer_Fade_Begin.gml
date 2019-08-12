///@func Layer_Fade_Begin()
///@desc The layer start script for the asset layers
if (instance_exists(obj_background_manager))
	{
	shader_set(shd_fade);
	shader_set_uniform_f(obj_background_manager.uni_black,1-obj_background_manager.background_clear_amount);
	}
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	}