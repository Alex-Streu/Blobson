/// @description Cleanup page

for (var i = 0; i < ds_list_size(pageObjects); i++)
{
	instance_destroy(pageObjects[| i]);
}

ds_list_clear(pageObjects);