/// @description Handle activity and character selection

if (!isLoaded) { return; }

var _id = id;

sprite_index = sprite;

switch (state)
{
	case SLOT_STATE.OFF:
		if (controller == -1 && global.device_number[player] != -1) { controller = global.device_number[player]; }
		
		if (controller > -1)
		{
			var xx=gamepad_axis_value(controller,gp_axislh);
			var yy=gamepad_axis_value(controller,gp_axislv);
			gamepad_set_axis_deadzone(controller,.25)
			
			if (abs(xx) > 0 || abs(yy) > 0) 
			{ 				
				load_player_profile(0);
				
				update_slot_menu(obj_menu_slot_base);
				
				state = SLOT_STATE.PLAYER; 
			}
		}
		break;
		
	case SLOT_STATE.PLAYER:
		if (controller == -1) { break; }
		
		if (cursor == noone) { cursor = create_player_cursor(id, cursorSprite); }
		
		cursor.isActive = true;
		
		gamepad_set_axis_deadzone(controller,.25)
		var xx = gamepad_axis_value(controller,gp_axislh);
		var yy = gamepad_axis_value(controller,gp_axislv);		
		var RT= gamepad_button_check_pressed(controller, gp_shoulderrb) || gamepad_button_check_pressed(controller, gp_shoulderr);
		var LT= gamepad_button_check_pressed(controller, gp_shoulderlb) || gamepad_button_check_pressed(controller, gp_shoulderl);
		
			
		//Move cursor
		cursor.x += xx*cursor.cursorSpeed;
		cursor.y += yy*cursor.cursorSpeed;
	
		//Clamp cursor into room
		clamp_object_in_room(cursor);
			
		//Check for character collision if not selected
		if (!isSelected)
		{
			var _character = noone;
				
			with (cursor)
			{
				_character = instance_place(x, y, obj_character_select_item);
			}
				
			with (obj_slot_portrait)
			{
				if (owner != _id) { continue; }
					
				character = _character;
			}
		}
		
		//Select item
		if (gamepad_button_check_pressed(controller, gp_face1))
		{			
			//Click selection
			with (cursor) 
			{  
				var _obj = instance_place(x, y, obj_menu_object);
				if (_obj != noone && _obj.owner == _id)
				{
					with (_obj) { event_user(0); }
				}
			}
			
			if (menu.allowCharacterSelect && character != noone) 
			{
				isSelected = true;
			}
		}
		
		//Back pressed
		if (gamepad_button_check_pressed(controller, gp_face2))
		{
			if (menu.allowCharacterSelect && isSelected) 
			{
				character = noone;
				isSelected = false;
			}
			else
			{
				update_slot_menu();
				if (ds_stack_size(menuStack) == 1) 
				{ 
					instance_destroy(cursor);
					cursor = noone;
					state = SLOT_STATE.OFF; 
				}
			}
		}
		
		//Triggers pressed
		if (RT || LT)
		{
			var _inc = RT == true ? 1 : -1;
			with (menu)
			{
				var _prev = pageIndex;
				pageIndex = clamp(pageIndex + _inc, 0, pageTotal-1);
				
				if (_prev != pageIndex) 
				{ 
					event_user(MENU_EVENT.CLEANUP); //Cleanup previous page
					event_user(MENU_EVENT.INIT); //Setup new page
				}
			}
		}
			
		////If Select is pressed, reset controls
		//if (gamepad_button_check_pressed(controller,gp_select))
		//{
		//	//Reset
		//	Custom_Controls_Reset(button_array,i);
		//}
		
		break;
}