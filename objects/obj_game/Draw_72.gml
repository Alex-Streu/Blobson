/// @description Clear the surface
if (!surface_exists(game_surface))
	{
	game_surface = surface_create(camera_width, camera_height);
	}
//if (current_frame % 2 == 0)
//	{
surface_set_target(game_surface);
draw_clear(c_white);
surface_reset_target();
//	}