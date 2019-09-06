/// @description Create pages

// Inherit the parent event
event_inherited();

page = ds_list_create();

#region Page Creation

//Draw settings
var padding = 5;
var col1 = (owner.sprite_width) / 2 - (sprite_get_width(object_get_sprite(obj_slot_profile_item)) * 2 + padding) / 2
var col2 = col1 + sprite_get_width(object_get_sprite(obj_slot_profile_item)) + padding;
var startY = 50;

//Pages setup
pageTotal  = ceil(ds_list_size(global.profiles) / itemCap);
pageIndex = clamp(pageIndex, 0, pageTotal-1);
var numProfiles = ds_list_size(global.profiles) - pageIndex*itemCap;

//Create profile items
for (var i = 0; i < itemCap && i < numProfiles; i++)
{
	var startX = i % 2 == 0 ? col1 : col2;
	var item = instance_create_layer(owner.x + startX, owner.y + startY + (floor(i/2) * (sprite_get_height(object_get_sprite(obj_slot_profile_item)) + padding)), "MenuLayer", obj_slot_profile_item);
	item.owner = owner;
	item.profile = global.profiles[| i + pageIndex*itemCap];
		
	ds_list_add(pageObjects, item);
}

//Create add profile
var _w = sprite_get_width(object_get_sprite(obj_slot_add_profile));
var _h = sprite_get_height(object_get_sprite(obj_slot_add_profile));
var item = instance_create_layer(owner.x + owner.sprite_width - _w - 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_add_profile);
item.owner = owner;
		
ds_list_add(pageObjects, item);

//Bottom page index
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, owner.sprite_height - 15 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = stringify("{0}/{1}", pageIndex + 1, pageTotal);
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;

ds_list_add(page, item);

#endregion