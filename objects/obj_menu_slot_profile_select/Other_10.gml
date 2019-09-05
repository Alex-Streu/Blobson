/// @description Create pages

// Inherit the parent event
event_inherited();

page = ds_list_create();

#region Page Creation

//Profile items
var padding = 5;
var col1 = (owner.sprite_width) / 2 - (sprite_get_width(object_get_sprite(obj_slot_profile_item)) * 2 + padding) / 2
var col2 = col1 + sprite_get_width(object_get_sprite(obj_slot_profile_item)) + padding;
var startY = 50;
var numProfiles = ds_list_size(global.profiles) - pageIndex*itemCap;
pageTotal  = ceil(ds_list_size(global.profiles) / itemCap);

for (var i = 0; i < itemCap && i < numProfiles; i++)
{
	var startX = i % 2 == 0 ? col1 : col2;
	var item = instance_create_layer(owner.x + startX, owner.y + startY + (floor(i/2) * (sprite_get_height(object_get_sprite(obj_slot_profile_item)) + padding)), "MenuLayer", obj_slot_profile_item);
	item.owner = owner;
	item.profile = global.profiles[| i + pageIndex*itemCap];
		
	ds_list_add(pageObjects, item);
}

//Bottom page index
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, owner.sprite_height - 15 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = stringify("{0}/{1}", pageIndex + 1, pageTotal);
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;

ds_list_add(page, item);

#endregion