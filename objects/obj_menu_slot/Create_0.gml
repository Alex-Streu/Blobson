/// @description Initialize menu
enum MENU_EVENT
{
	INIT = 0,
	CLEANUP = 1
}

pageIndex = 0; //Set default
pageTotal = 1; //Set default
owner = noone; //Set default
page = ds_list_create();
pageObjects = ds_list_create();
isInitialized = false;
allowCharacterSelect = false;

// Item has properties -- position, type, (text, font, fontScale, halign), (obj, instance, layer, owner, isRendered), (sprite, subimg)
