///@func move_x_bounce()
//Only to be used during hitstun / tumble
var _current_speed = point_distance(x, y, x + hsp, y + vsp);
//Loop 1 pixel at a time
if (hsp != 0)
	{
	for(var i = 0; i < abs(hsp); i++)
		{
		if (!place_meeting(x + sign(hsp), y, obj_solid))
			{
			x += sign(hsp);
			}
		else
			{
			//Visual effects
			var fx = fx_create
				(
				spr_dust_impact,
				1,
				0,
				13,
				hsp > 0 ? bbox_right + 1 : bbox_left,
				y,
				clamp(_current_speed / 6, 1, 4),
				hsp > 0 ? 180 : 0,
				"FX_Layer_Below"
				);
			fx.image_blend = palette_get_color(palettes[player_color], 0);
			//Only bounce if the speed is high enough
			if (_current_speed >= bounce_minimum_speed)
				{
				hsp = (-hsp * bounce_speed_multiplier);
				}
			else
				{
				hsp_frac = 0;
				hsp = 0;
				}
			check_tech();
			break;
			}
		}
	}