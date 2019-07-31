///@func stick_direction(stick,direction)
///@param stick
///@param direction
//Checks if the stick is in the direction enum
var _stick=argument[0]==Lstick ? control_direction_l : control_direction_r;
var _return=false;
switch(argument[1])
	{
	case DIR.horizontal:
		if (abs(angle_difference(0,_stick))<stick_direction_sensitivity ||
			abs(angle_difference(180,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.right:
		if (abs(angle_difference(0,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.left:
		if (abs(angle_difference(180,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.vertical:
		if (abs(angle_difference(270,_stick))<stick_direction_sensitivity ||
			abs(angle_difference(90,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.down:
		if (abs(angle_difference(270,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.up:
		if (abs(angle_difference(90,_stick))<stick_direction_sensitivity)
			{
			_return=true;
			}
		break;
	case DIR.up_right:
		_return=(stick_direction(argument[0],DIR.up) && stick_direction(argument[0],DIR.right));
		break;
	case DIR.up_left:
		_return=(stick_direction(argument[0],DIR.up) && stick_direction(argument[0],DIR.left));
		break;
	case DIR.down_right:
		_return=(stick_direction(argument[0],DIR.down) && stick_direction(argument[0],DIR.right));
		break;
	case DIR.down_left:
		_return=(stick_direction(argument[0],DIR.down) && stick_direction(argument[0],DIR.left));
		break;
	case DIR.any:
		_return=true;
		break;
	}
return _return;