///@func configure_converted_buttons(controller)
///@param controller
var _controller = argument[0];

if (buttons != noone) { return; }
buttons = ds_map_create();

var desc = _controller > -1 ? string_lower(gamepad_get_description(_controller)) : "xbox";
if (string_count("nintendo", desc) > 0) //Nintendo
{
	buttons[? "Y"] = gp_face1;
	buttons[? "B"] = gp_face2;
	buttons[? "A"] = gp_face3;
	buttons[? "X"] = gp_face4;
	buttons[? "LB"] = gp_shoulderl;
	buttons[? "RB"] = gp_shoulderr;
	buttons[? "LT"] = gp_shoulderlb;
	buttons[? "RT"] = gp_shoulderrb;
	buttons[? "Start"] = gp_start;
	buttons[? "Back"] = gp_select;
	buttons[? "DPadUp"] = gp_padu;
	buttons[? "DPadDown"] = gp_padd;
	buttons[? "DPadLeft"] = gp_padl;
	buttons[? "DPadRight"] = gp_padr;
	buttons[? "RStick"] = gp_stickr;
}
else //Xbox by default
{
	buttons[? "A"] = gp_face1;
	buttons[? "B"] = gp_face2;
	buttons[? "X"] = gp_face3;
	buttons[? "Y"] = gp_face4;
	buttons[? "LB"] = gp_shoulderl;
	buttons[? "RB"] = gp_shoulderr;
	buttons[? "LT"] = gp_shoulderlb;
	buttons[? "RT"] = gp_shoulderrb;
	buttons[? "Start"] = gp_start;
	buttons[? "Back"] = gp_select;
	buttons[? "DPadUp"] = gp_padu;
	buttons[? "DPadDown"] = gp_padd;
	buttons[? "DPadLeft"] = gp_padl;
	buttons[? "DPadRight"] = gp_padr;
	buttons[? "RStick"] = gp_stickr;
}