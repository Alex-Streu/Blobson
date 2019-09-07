///@func stick_speed(stick)
///@param stick
//Grab the cached speed values
return argument[0] == Lstick ? control_speed_l : control_speed_r;
/*
var _stickx=argument0==Lstick ? gp_axislh : gp_axisrh;
var _sticky=argument0==Lstick ? gp_axislv : gp_axisrv;
var cxl=control_xprevious_l[stick_check_frames-1];
var cyl=control_yprevious_l[stick_check_frames-1];
return point_distance(cxl,cyl,gamepad_axis_value(controller,_stickx),gamepad_axis_value(controller,_sticky));