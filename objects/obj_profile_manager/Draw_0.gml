/// @description Draw the profiles
var _x = 10, _y = 10, _pad = 300;
for(var i=0;i<ds_list_size(all_profiles);i++)
	{
	//Handle initial / redraw
	if (!surface_exists(profile_surfs[|i]))
		{
		profile_surfs[|i] = surface_create(room_width,room_height);
		clear_surfs[@i] = true;
		}
	if (clear_surfs[i])
		{
		clear_surfs[@i] = false;
		surface_set_target(profile_surfs[|i]);
		Profile_Draw(all_profiles[|i],0,0,width,height);
		surface_reset_target();
		}
	//Draw the surface
	draw_surface(profile_surfs[|i],_x + (_pad * i), _y);
	}