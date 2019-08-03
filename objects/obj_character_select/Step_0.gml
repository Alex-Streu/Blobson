/// @description Handle character selection
if (navTimer <= 0) 
{
	var xx, yy;
	var newIndex = false;
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
		
			//Updates the new selected item
			if (abs(yy)>stick_tilt_amount)
			{
				csItems[# indexX, indexY].selected = false;
				indexY = clamp(indexY + sign(yy), 0, ds_list_size(rowSizes)-1);
				indexX = clamp(indexX, 0, rowSizes[| indexY]);
				newIndex = true;
			}
			if (abs(xx)>stick_tilt_amount)
			{
				csItems[# indexX, indexY].selected = false;
				indexX = clamp(indexX + sign(xx), 0, rowSizes[| indexY]);
				newIndex = true;
			}
			
			if (newIndex) 
			{				
				csItems[# indexX, indexY].selected = true;
				
				var _p = players[? "Player1"];
				_p[? "Instance"].portrait = csItems[# indexX, indexY].portrait;
				
				navTimer = menu_navigation_lag;
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
} else { navTimer--; }