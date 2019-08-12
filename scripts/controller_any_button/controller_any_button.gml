///@func controller_any_button(device_number,[stick_tilt_amount])
///@param device_number
///@param [stick_tilt_amount]
var c = argument[0];
var a = argument_count > 1 ? argument[1] : 0.9;
return
	abs(gamepad_axis_value(c, gp_axislh)) > a	||
	abs(gamepad_axis_value(c, gp_axislv)) > a	||
	abs(gamepad_axis_value(c, gp_axisrh)) > a	||
	abs(gamepad_axis_value(c, gp_axisrv)) > a	||
	gamepad_button_check(c, gp_face1)			||
	gamepad_button_check(c, gp_face2)			||
	gamepad_button_check(c, gp_face3)			||
	gamepad_button_check(c, gp_face4)			||
	gamepad_button_check(c, gp_shoulderr)		||
	gamepad_button_check(c, gp_shoulderl)		||
	gamepad_button_check(c, gp_shoulderrb)		||
	gamepad_button_check(c, gp_shoulderlb)		||
	gamepad_button_check(c, gp_start)			||
	gamepad_button_check(c, gp_padr)			||
	gamepad_button_check(c, gp_padl)			||
	gamepad_button_check(c, gp_padd)			||
	gamepad_button_check(c, gp_padu);