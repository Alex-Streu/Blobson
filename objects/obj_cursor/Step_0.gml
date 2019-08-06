/// @description Update cursor position and selection

var xx, yy;

//Navigate the menu
var _controller = global.device_number[player];
if (_controller != -1)
{
	xx=gamepad_axis_value(_controller,gp_axislh);
	yy=gamepad_axis_value(_controller,gp_axislv);
	//RT=gamepad_button_check_pressed(_controller, gp_shoulderrb)
	//LT=gamepad_button_check_pressed(_controller, gp_shoulderlb)
		
			
	//Move cursor
	x += xx*cursorSpeed;
	y += yy*cursorSpeed;
	
	//Clamp cursor into room
	clamp_object_in_room(self);
		
	//Select stage
	if (gamepad_button_check_pressed(_controller, gp_face1))
	{
		var _stage = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_stage_select_item, true, true);
		if (_stage != noone)
		{
			room_goto(_stage.toRoom);
		}
	}	
}