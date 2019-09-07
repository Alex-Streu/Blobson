/// @description Handle deletion
event_inherited();

//Turn off Y event if default
if (profile != noone && profile[? "IsDefault"]) { hasYEvent = false; }

if (isDeleting) 
{ 
	deleteProgress += deleteSpeed; 
	
	if (deleteProgress >= 1)
	{
		isDeleting = false;
		var _profile = profile;
		with (owner)
		{
			delete_profile(_profile);
			with (menu)
			{
				event_user(MENU_EVENT.CLEANUP);
				event_user(MENU_EVENT.INIT);
			}
			
			holdingComplete = true;
		}
	}
}