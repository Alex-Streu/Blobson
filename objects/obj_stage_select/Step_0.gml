/// @description Handle screen input
for(var i = 0; i < number_of_devices; i++)
{
	if (gamepad_button_check_pressed(i, gp_face2)) room_goto(rm_Character_Select);
}
	