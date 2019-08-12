//Neutral Special - Draw
if (attack_phase == 1)
	{
	var tx = 0, ty = 0;
	for(var i = 0; i < array_length_1d(program); i++)
		{
		tx += lengthdir_x(120, program[i]);
		ty += lengthdir_y(120, program[i]);
		draw_set_color(c_black);
		draw_circle(x + tx, y + ty, 4, false);
		}
	}