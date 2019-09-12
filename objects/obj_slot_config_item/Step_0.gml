/// @description Handle deletion
event_inherited();

//Turn off Y event if default
if (config != noone && config[? "IsDefault"]) { hasYEvent = false; }

if (isDeleting) 
{ 
	deleteProgress += deleteSpeed; 
	
	if (deleteProgress >= 1)
	{
		isDeleting = false;
		var _config = config;
		with (owner)
		{
			delete_profile(_config);
			with (menu)
			{
				event_user(MENU_EVENT.CLEANUP);
				event_user(MENU_EVENT.INIT);
			}
			
			holdingComplete = true;
		}
	}
}