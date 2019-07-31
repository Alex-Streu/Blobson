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
	if (day_night_cycle_enable)
		{
		//Calculate the RGB values for Day / Night
		var _r, _g, _b;
		var _time = (current_time / 1000) % 100;
		//Normal
		if (_time < 30)
			{
			_r = 0;
			_g = 0;
			_b = 0;
			}
		//Dusk
		else if (_time < 50)
			{
			var _amt = (_time - 30) / 20;
			_r = lerp(0, 0.15, _amt);
			_g = lerp(0, -0.1, _amt);
			_b = lerp(0, 0.1, _amt);
			}
		//Night
		else if (_time < 80)
			{
			var _amt = (_time - 50) / 30;
			_r = lerp(0.15, -0.4, _amt);
			_g = lerp(-0.1,-0.3,_amt);
			_b = lerp(0.1, -0.1, _amt);
			}
		//Dawn
		else if (_time < 100)
			{
			var _amt = (_time - 80) / 20;
			_r = lerp(-0.4, 0, _amt);
			_g = lerp(-0.3, 0, _amt);
			_b = lerp(-0.1, 0, _amt);
			}
		/*
		var _time = (current_time / 100) % 360;
		_r = clamp(dsin(_time), -0.1, 0.1);
		_g = clamp(dsin(_time), -0.15, 0);
		_b = clamp(dsin(_time + 180), -0.1, 0.1);
		show_debug_message("R " + string(_r) + " B" + string(_b));
		*/
		shader_set(shd_daynight);
		shader_set_uniform_f(uni_red,_r);
		shader_set_uniform_f(uni_green,_g);
		shader_set_uniform_f(uni_blue,_b);
		}
	draw_surface(game_surface, 0, 0);
	if (day_night_cycle_enable)
		{
		shader_reset();
		}
	gpu_set_blendenable(true);
	}