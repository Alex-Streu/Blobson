/// @description Handle activity and character selection
if (!isActive)
{
	character = noone;
	sprite_index = inactiveSprite;
	return;
}
	
sprite_index = sprite;

if (profile == noone)
{
	var _p = instance_place(x, y, obj_profile_selector);
	if (_p != noone) 
	{ 
		var _default = ds_map_create();
		_default[? "Name"] = name;
		_default[? "Value"] = noone;
		
		var _manage = ds_map_create();
		_manage[? "Name"] = "Manage...";
		_manage[? "Value"] = -1;
		
		ds_list_insert(profiles, 0, _default);	
		ds_list_insert(profiles, 1, _manage);		
		var _profiles = profiles;
		
		var _player = player;
		
		with (_p)
		{
			profiles = _profiles;
			selected = _default;
			player = _player;
		}
		
		profile = _p;
	}
}
else
{
	profile.isActive = isActive;
}