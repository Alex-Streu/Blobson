///@func get_button_names(controller)
///@param controller
///@desc Gets button names based on the controller description.

var _controller = argument[0];

var button_name = [];
var desc = _controller > -1 ? string_lower(gamepad_get_description(_controller)) : "xbox";

if (string_count("nintendo", desc) > 0) //Nintendo
{
	button_name[0]="Y";
	button_name[1]="B";
	button_name[2]="A";
	button_name[3]="X";
	button_name[4]="L";
	button_name[5]="R";
	button_name[6]="ZL";
	button_name[7]="ZR";
	button_name[8]="+";
	button_name[9]="-";
	button_name[10]="DPad";
	button_name[11]="Rstick";
}
else //Xbox by default
{
	button_name[0] = "A";
	button_name[1] = "B";
	button_name[2] = "X";
	button_name[3] = "Y";
	button_name[4] = "LB";
	button_name[5] = "RB";
	button_name[6] = "LT";
	button_name[7] = "RT";
	button_name[8] = "Start";
	button_name[9] = "Back";
	button_name[10] = "DPad";
	button_name[11] = "Rstick";
}

return button_name;