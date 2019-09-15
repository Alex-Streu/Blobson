///@func get_button_names(controller)
///@param controller
///@desc Gets button names based on the controller description.

var _controller = argument[0];

var button_name = ds_map_create();
var desc = _controller > -1 ? string_lower(gamepad_get_description(_controller)) : "xbox";

if (string_count("nintendo", desc) > 0) //Nintendo
{
	button_name[? gp_face1] = "Y";
	button_name[? gp_face2] = "B";
	button_name[? gp_face3] = "A";
	button_name[? gp_face4] = "X";
	button_name[? gp_shoulderl] = "L";
	button_name[? gp_shoulderr] = "R";
	button_name[? gp_shoulderlb] = "ZL";
	button_name[? gp_shoulderrb] = "ZR";
	button_name[? gp_start] = "+";
	button_name[? gp_select] = "-";
	button_name[? gp_padu] = "DU";
	button_name[? gp_padd] = "DD";
	button_name[? gp_padl] = "DL";
	button_name[? gp_padr] = "DR";
	button_name[? gp_stickl] = "LS";
	button_name[? gp_stickr] = "RS";
}
else //Xbox by default
{
	button_name[? gp_face1] = "A";
	button_name[? gp_face2] = "B";
	button_name[? gp_face3] = "X";
	button_name[? gp_face4] = "Y";
	button_name[? gp_shoulderl] = "LB";
	button_name[? gp_shoulderr] = "RB";
	button_name[? gp_shoulderlb] = "LT";
	button_name[? gp_shoulderrb] = "RT";
	button_name[? gp_start] = "Start";
	button_name[? gp_select] = "Back";
	button_name[? gp_padu] = "DU";
	button_name[? gp_padd] = "DD";
	button_name[? gp_padl] = "DL";
	button_name[? gp_padr] = "DR";
	button_name[? gp_stickl] = "LS";
	button_name[? gp_stickr] = "RS";
}

return button_name;