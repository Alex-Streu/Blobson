///@func Stick_Cache_Values(stick,axish,axisv)
///@param stick
///@param axish
///@param axisv
///@desc Stores calculated values in instance variables for later use
var _x = argument[1];
var _y = argument[2];

if (argument[0] == Lstick)
	{
	//Values
	control_xvalue_l = _x;
	control_yvalue_l = _y;
	
	//Direction
	control_direction_l = point_direction(0, 0, _x, _y);
	
	//Previous Values
	for(var i = stick_check_frames - 1; i > 0; i--)
		{
		control_xprevious_l[i] = control_xprevious_l[i-1];
		control_yprevious_l[i] = control_yprevious_l[i-1];
		}
	control_xprevious_l[0] = _x;
	control_yprevious_l[0] = _y;
	
	//Speed
	var _xp=control_xprevious_l[stick_check_frames-1];
	var _yp=control_yprevious_l[stick_check_frames-1];
	control_speed_l = point_distance(_xp, _yp, _x, _y);
	
	//Distance
	control_distance_l = point_distance(0, 0, _x, _y);
	} 
else
	{
	//Values
	control_xvalue_r = _x;
	control_yvalue_r = _y;
	
	//Direction
	control_direction_r = point_direction(0, 0, _x, _y);
	
	//Previous Values
	for(var i = stick_check_frames - 1; i > 0; i--)
		{
		control_xprevious_r[i] = control_xprevious_r[i-1];
		control_yprevious_r[i] = control_yprevious_r[i-1];
		}
	control_xprevious_r[0] = _x;
	control_yprevious_r[0] = _y;
	
	//Speed
	var _xp=control_xprevious_r[stick_check_frames-1];
	var _yp=control_yprevious_r[stick_check_frames-1];
	control_speed_r = point_distance(_xp, _yp, _x, _y);
	
	//Distance
	control_distance_r = point_distance(0, 0, _x, _y);
	}