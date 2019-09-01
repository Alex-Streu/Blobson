/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Item has properties -- position, type, (text, font, fontScale, halign), (obj, layer), (sprite, subimg)
var page = ds_list_create();
var item = ds_map_create();
item[? "Position"] = [0, 0];
item[? "Type"] = MENU_ITEM_TYPE.OBJECT;
item[? "Obj"] = obj_profile_selector;
item[? "Layer"] = "MenuLayer";
ds_list_add(page, item);

pages[| 0] = page;