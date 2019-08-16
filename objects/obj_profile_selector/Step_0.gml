/// @description Handle click logic

//Clicked logic
if (clicked)
{
	clicked = false;

	switch (state)
	{
		case DDSTATE.CLOSED:
			var _player = player;
			items = ds_list_create();
			for (var i = 0; i < ds_list_size(profiles); i++)
			{
				var _p = profiles[| i];
				var _self = self;
				var _item = instance_create_layer(x, y + i*sprite_height, "ProfilesLayer", obj_profile_selector_item);
	
				with (_item)
				{
					owner = _self;
					values = _p;
					player = _player;
				}
		
				items[| i] = _item;
			}
			
			selectedIndex = 0;
			items[| selectedIndex].isHovered = true;
		
			slot.state = SLOT_STATE.MENU;
			state = DDSTATE.OPEN;
			break;
		
		case DDSTATE.OPEN:
			if (items != noone)
			{
				for (var i = 0; i < ds_list_size(items); i++)
				{
					instance_destroy(items[| i]);
				}
			
				items = noone;
			}
		
			slot.state = SLOT_STATE.CURSOR;
			
			state = DDSTATE.CLOSED;
			break;
	}
	
	return;
}

//Menu selection logic
if (slot != noone && slot.state == SLOT_STATE.MENU)
{
	var xx, yy;

	//Navigate the menu
	var _controller = global.device_number[player];
	if (_controller != -1)
	{
		xx=gamepad_axis_value(_controller,gp_axislh);
		yy=gamepad_axis_value(_controller,gp_axislv);
		gamepad_set_axis_deadzone(_controller,.25)
		
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
		
		//Select item
		if (gamepad_button_check_pressed(_controller, gp_face1))
		{		
			selected = items[| selectedIndex].values;
			clicked = true;
			show_debug_message(string(selected[? "Name"]))
		
		}
		
		//Close Menu
		if (gamepad_button_check_pressed(_controller, gp_face2))
		{
			clicked = true;
		}
	}
}