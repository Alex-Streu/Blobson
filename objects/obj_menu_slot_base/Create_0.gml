/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Item has properties -- position, type, (text, font, fontScale, halign), (obj, layer, owner, isRendered), (sprite, subimg)
var page = ds_list_create();

#region Main Page Creation

//Profile selector
var item = ds_map_create();
item[? "Position"] = [0, 0];
item[? "Type"] = MENU_ITEM_TYPE.OBJECT;
item[? "Obj"] = obj_profile_selector;
item[? "Layer"] = "MenuLayer";
item[? "Owner"] = owner;
item[? "IsRendered"] = false;
ds_list_add(page, item);

//Slot portrait
item = ds_map_create();
item[? "Position"] = [10, 30];
item[? "Type"] = MENU_ITEM_TYPE.OBJECT;
item[? "Obj"] = obj_slot_portrait;
item[? "Layer"] = "MenuLayer";
item[? "Owner"] = owner;
item[? "IsRendered"] = false;
ds_list_add(page, item);

#endregion

pages[| 0] = page;