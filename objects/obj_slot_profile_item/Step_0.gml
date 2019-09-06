/// @description Handle hover logic
check_if_hovered();

if (isDeleting) 
{ 
	deleteProgress += deleteSpeed; 
	
	if (deleteProgress >= 1)
	{
		ds_list_delete(global.profiles, profile[? "Index"]);
		isDeleting = false;
		with (owner)
		{
			with (menu)
			{
				event_user(MENU_EVENT.CLEANUP);
				event_user(MENU_EVENT.INIT);
			}
			
			holdingComplete = true;
		}
	}
}