/// @description Handle activity and character selection
if (!isActive)
{
	character = noone;
	sprite_index = inactiveSprite;
	return;
}
	
sprite_index = sprite;

#region Setup Profile
//if (profile == noone)
//{
//	var _p = instance_place(x, y, obj_profile_selector);
//	if (_p != noone) 
//	{ 
//		var _default = ds_map_create();
//		_default[? "Name"] = name;
//		_default[? "Value"] = noone;
		
//		var _manage = ds_map_create();
//		_manage[? "Name"] = "Manage...";
//		_manage[? "Value"] = -1;
		
//		ds_list_insert(profiles, 0, _default);	
//		ds_list_insert(profiles, 1, _manage);		
//		var _profiles = profiles;
		
//		with (_p)
//		{
//			profiles = _profiles;
//			selected = _default;
//		}
		
//		profile = _p;
//	}
//}
//else
//{
//	profile.isActive = isActive;
//}
#endregion

var _controller = global.device_number[player];
if (_controller != -1)
{
	switch (state)
	{
		case SLOT_STATE.CURSOR:
			cursor.isActive = true;
			
			var xx=gamepad_axis_value(_controller,gp_axislh);
			var yy=gamepad_axis_value(_controller,gp_axislv);
			gamepad_set_axis_deadzone(_controller,.25)
			//RT=gamepad_button_check_pressed(_controller, gp_shoulderrb)
			//LT=gamepad_button_check_pressed(_controller, gp_shoulderlb)
		
			
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
				
				character = _character;
			}
		
			//Select item
			if (gamepad_button_check_pressed(_controller, gp_face1))
			{		
				if (character != noone) 
				{
					isSelected = true;
				}		
		
				var _profile = false;
				var _self = self;
				with (cursor) { _profile = place_meeting(x, y, _self.profile); }
				
				if (_profile)
				{
					profile.clicked = true;
					state = SLOT_STATE.MENU;
				}
			}
		
			//Deselect character
			if (gamepad_button_check_pressed(_controller, gp_face2))
			{
				if (isSelected) 
				{
					character = noone;
					isSelected = false;
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
		
			break;
		
		case SLOT_STATE.MENU:
			cursor.isActive = false;
			
			xx=gamepad_axis_value(_controller,gp_axislh);
			yy=gamepad_axis_value(_controller,gp_axislv);
			gamepad_set_axis_deadzone(_controller,.25)
			
			with (profile)
			{
				if (abs(yy) > stick_tilt_amount)
				{
					if (!yPress)
					{
						yPress = true;
						var _index = selectedIndex + sign(yy);
						_index = clamp(_index, 0, ds_list_size(items) - 1);
				
						items[| selectedIndex].isHovered = false;
						selectedIndex = _index;
						items[| selectedIndex].isHovered = true;
					}
				}
				else
				{
					yPress = false;
				}
			}
		
			//Select item
			if (gamepad_button_check_pressed(_controller, gp_face1))
			{		
				with (profile)
				{
					selected = items[| selectedIndex].values;
					clicked = true;
				}
				
				state = SLOT_STATE.CURSOR;
			}
		
			//Close Menu
			if (gamepad_button_check_pressed(_controller, gp_face2))
			{
				profile.clicked = true;				
				state = SLOT_STATE.CURSOR;
			}
		
			break;
	}
}