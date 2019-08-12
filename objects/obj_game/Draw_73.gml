/// @description Draw the surface
//Make sure the surface exists first
if (!surface_exists(game_surface))
	{
	game_surface = surface_create(camera_width, camera_height);
	//buffer_set_surface(game_buff,game_surface,0,0,0);
	}
else
	{
	//buffer_fill(game_buff,0,0,0,buffer_tell(game_buff));
	//buffer_get_surface(game_buff,game_surface,0,0,0);
	}
	
//Particle System Draw
if (game_surface_enable) surface_set_target(game_surface);
part_system_drawit(global.part_sys);
if (game_surface_enable) surface_reset_target();

//Draw the new surface
if (game_surface_enable)
	{
	gpu_set_blendenable(false);
	daynight_set();
	draw_surface(game_surface, 0, 0);
	daynight_reset();
	gpu_set_blendenable(true);
	}