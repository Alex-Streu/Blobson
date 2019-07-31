/// @description
if (instance_exists(obj_game) && obj_game.state != GAME_STATE.startup) exit;
#region Voronoi Frame
for(var i=0;i<length;i++)
	{
	point_x[@i] += point_hsp[i];
	point_y[@i] += point_vsp[i];
	if (point_x[i] > camera_width && point_hsp[i] > 0 ||
		point_x[i] < 0 && point_hsp[i] < 0)
		{
		point_hsp[@i] *= -1;
		}
	if (point_y[i] > camera_height && point_vsp[i] > 0 ||
		point_y[i] < 0 && point_vsp[i] < 0)
		{
		point_vsp[@i] *= -1;
		}
	}
#endregion