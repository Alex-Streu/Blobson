///@func check_waveland_script()
///@desc Allows wavelanding (including platform snap)
//Only waveland if you are colliding with a block from the top
if (vsp>=0)
	{
	//Snap landing onto platforms
	var _plat=instance_position(x,bbox_bottom,obj_platform);
	if (_plat!=noone && bbox_bottom-_plat.bbox_top<=platform_snap_threshold)
		{
		while(!on_plat(x,y) && !place_meeting(x,y-1,obj_solid)) y-=1;
		//Change state & set timer
		set_state(PLAYER_STATE.wavelanding);
		waveland_frame=waveland_time;
		//Set the speeds
		vsp=0;
		vsp_frac=0;
		//Do not set hsp because it carries over to wavelanding
		hsp+=(waveland_speed_boost*sign(hsp));
		return true;
		}
	else
	//Normal landing
	if (on_ground())
		{
		//Change state & set timer
		set_state(PLAYER_STATE.wavelanding);
		waveland_frame=waveland_time;
		//Set the speeds
		vsp=0;
		vsp_frac=0;
		//Do not set hsp because it carries over to wavelanding
		hsp+=(waveland_speed_boost*sign(hsp));
		return true;
		}
	}
return false;