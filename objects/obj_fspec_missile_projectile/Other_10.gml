/// @description
fx_create(spr_projectile_trail,1,0,28,x,y,2,irandom(360),"FX_Layer_Below");

//Turning
var _cx = owner.control_xvalue_l;
var _cy = owner.control_yvalue_l;
if (point_distance(0,0,_cx,_cy))
	{
	var _newdir = point_direction(0,0,_cx,_cy);
	var _turn_amount = clamp(angle_difference(_newdir,image_angle),-turn_speed,turn_speed);

	image_angle += _turn_amount;
	}
hsp = lengthdir_x(shoot_speed,image_angle);
vsp = lengthdir_y(shoot_speed,image_angle);

event_inherited();