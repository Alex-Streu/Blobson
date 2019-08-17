/// @description Handle click logic

//Clicked logic
if (clicked)
{
	clicked = false;

	switch (state)
	{
		case DDSTATE.CLOSED:
			items = ds_list_create();
			for (var i = 0; i < ds_list_size(profiles); i++)
			{
				var _p = profiles[| i];
				var _item = instance_create_layer(x, y + i*sprite_height, "ProfilesLayer", obj_profile_selector_item);
	
				with (_item)
				{
					values = _p;
				}
		
				items[| i] = _item;
			}
			
			selectedIndex = 0;
			items[| selectedIndex].isHovered = true;
			
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
			
			state = DDSTATE.CLOSED;
			break;
	}
	
	return;
}