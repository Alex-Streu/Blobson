///@func move_y_bounce()
//Only to be used during hitstun / tumble
var _current_speed=point_distance(x,y,x+hsp,y+vsp);
//Loop 1 pixel at a time
if (vsp!=0)
	{
	for(var i=0;i<abs(vsp);i++)
		{
		if (vsp<0)
			{
			if (!place_meeting(x,y+sign(vsp),obj_solid))
				{
				y+=sign(vsp);
				}		
			else
				{
				//Visual effects
				var fx = create_fx
					(
					spr_dust_impact,
					1,
					0,
					13,
					x,
					vsp>0?bbox_bottom+1:bbox_top,
					clamp(_current_speed/6,1,5),
					vsp>0?90:270,
					"FX_Layer_Below"
					);
				fx.image_blend = palette_get_color(palettes[player_color],0);
				//Only bounce is the speed is high enough / if you are going downwards
				if (_current_speed>=bounce_minimum_speed || vsp>0)
					{
					vsp=(-vsp * bounce_speed_multiplier);
					}
				else
					{
					vsp_frac=0;
					vsp=0;
					}
				//Teching	
				check_tech();
				break;
				}
			}
		else
		if (vsp>0)
			{
			//No exceptions for droppping through platforms - you always bounce off platforms
			if (on_ground())
				{
				//Visual effects
				var fx = create_fx
					(
					spr_dust_impact,
					1,
					0,
					13,
					x,
					vsp>0?bbox_bottom+1:bbox_top,
					clamp(_current_speed/6,1,5),
					vsp>0?90:270,
					"FX_Layer_Below"
					);
				fx.image_blend = palette_get_color(palettes[player_color],0);
				//Only bounce is the speed is high enough
				if (_current_speed>=bounce_minimum_speed)
					{
					vsp=(-vsp * bounce_speed_multiplier);
					}
				else
					{
					vsp_frac=0;
					vsp=0;
					}
				//Teching
				check_tech();
				break;
				}
			else
				{
				y+=sign(vsp);
				}
			//Teching
			if (on_ground())
				{
				check_tech();
				}
			}
		}
	}