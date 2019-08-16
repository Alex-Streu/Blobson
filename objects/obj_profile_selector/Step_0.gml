/// @description Handle click logic
if (!clicked) { return; }
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