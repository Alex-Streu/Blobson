///@func stick_value(stick,direction)
///@param stick
///@param direction
var _stick_x=argument0==Lstick ? control_xvalue_l : control_xvalue_r;
var _stick_y=argument0==Lstick ? control_yvalue_l : control_yvalue_r;
switch(argument1)
	{
	case DIR.horizontal:
		return _stick_x;
		break;
	case DIR.left:
		return _stick_x<0 ? _stick_x : 0;
		break;
	case DIR.right:
		return _stick_x>0 ? _stick_x : 0;
	case DIR.vertical:
		return _stick_y;
		break;
	case DIR.down:
		return _stick_y>0 ? _stick_y : 0;
		break;
	case DIR.up:
		return _stick_y<0 ? _stick_y : 0;
		break;
	case DIR.any:
		return point_distance(0,0,_stick_x,_stick_y);
		break;
	}
return 0;