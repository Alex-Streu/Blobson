/// @description Update cursor position and selection

//if (navTimer <= 0) 
{
	var xx, yy;
	for(var i = 0; i < max_players; i++)
	{
		//Navigate the menu
		var _controller = global.device_number[i];
		if (_controller != -1)
		{
			xx=gamepad_axis_value(_controller,gp_axislh);
			yy=gamepad_axis_value(_controller,gp_axislv);
			//RT=gamepad_button_check_pressed(_controller, gp_shoulderrb)
			//LT=gamepad_button_check_pressed(_controller, gp_shoulderlb)
		
			
			//Move cursor
			x += xx*cursorSpeed;
			y += yy*cursorSpeed;
			
			//Check for character collision
			var _character = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_character_select_item, true, true);
			if (_character != noone)
			{
				slot.portrait = _character.portrait;
			}
			
			////If Select is pressed, reset controls
			//if (gamepad_button_check_pressed(_controller,gp_select))
			//{
			//	//Reset
			//	Custom_Controls_Reset(button_array,i);
			//}
			
			//Start the game
			if (gamepad_button_check_pressed(_controller,gp_start) || gamepad_button_check_pressed(_controller, gp_face1))
			{
				room_goto(rm_Training);
				break;
			}
			
			//if (RT)
			//{
			//	pal_select += 1;
			//}
			
			//if (LT)
			//{
			//	pal_select -= 1;
			//}			
		}
	}
} //else { navTimer--; }