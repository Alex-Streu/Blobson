/// @description Update cursor position and selection

var xx, yy;

//Navigate the menu
var _controller = global.device_number[player];
if (_controller != -1)
{
	xx=gamepad_axis_value(_controller,gp_axislh);
	yy=gamepad_axis_value(_controller,gp_axislv);
	gamepad_set_axis_deadzone(_controller,.25)
	//RT=gamepad_button_check_pressed(_controller, gp_shoulderrb)
	//LT=gamepad_button_check_pressed(_controller, gp_shoulderlb)
		
			
	//Move cursor
	x += xx*cursorSpeed;
	y += yy*cursorSpeed;
	
	//Clamp cursor into room
	clamp_object_in_room(self);
			
	//Check for character collision if not selected
	if (!slot.isSelected)
	{
		var _character = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_character_select_item, true, true);
		if (_character != noone)
		{
			character = _character;
			slot.character = character;
		}
		else
		{ 
			character = noone; 
			slot.character = noone;
		}
	}
		
	//Select character
	if (gamepad_button_check_pressed(_controller, gp_face1))
	{
		if (character != noone) 
		{
			slot.isSelected = true;
		}
	}
		
	//Deselect character
	if (gamepad_button_check_pressed(_controller, gp_face2))
	{
		if (slot.isSelected) 
		{
			character = noone; 
			slot.character = noone;
			slot.isSelected = false;
		}
	}
			
	////If Select is pressed, reset controls
	//if (gamepad_button_check_pressed(_controller,gp_select))
	//{
	//	//Reset
	//	Custom_Controls_Reset(button_array,i);
	//}
			
	//if (RT)
	//{
	//	pal_select += 1;
	//}
			
	//if (LT)
	//{
	//	pal_select -= 1;
	//}			
}