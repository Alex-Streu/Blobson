/// @description Create pages

// Inherit the parent event
event_inherited();

#region Page Creation
//Top page text
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, 10 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = "Hold Y to delete";
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, 30 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = "Press X to edit";
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

//Draw settings
var padding = 5;
var col1 = (owner.sprite_width) / 2 - (sprite_get_width(object_get_sprite(obj_slot_profile_item)) * 2 + padding) / 2
var col2 = col1 + sprite_get_width(object_get_sprite(obj_slot_profile_item)) + padding;
var startY = 50;

//Pages setup
var _profile = global.profiles[| owner.profile[? "Index"]]
var _configs = _profile[? "Configs"];
pageTotal  = ceil(ds_list_size(_configs) / itemCap);
pageIndex = clamp(pageIndex, 0, pageTotal-1);
var numConfigs = ds_list_size(_configs) - pageIndex*itemCap;

//Create config items
for (var i = 0; i < itemCap && i < numConfigs; i++)
{
	var startX = i % 2 == 0 ? col1 : col2;
	var item = instance_create_layer(owner.x + startX, owner.y + startY + (floor(i/2) * (sprite_get_height(object_get_sprite(obj_slot_config_item)) + padding)), "MenuLayer", obj_slot_config_item);
	item.owner = owner;
	item.config = _configs[| i + pageIndex*itemCap];
		
	ds_list_add(pageObjects, item);
}

//Create add config
var _w = sprite_get_width(object_get_sprite(obj_slot_add_config));
var _h = sprite_get_height(object_get_sprite(obj_slot_add_config));
var item = instance_create_layer(owner.x + owner.sprite_width - _w - 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_add_config);
item.owner = owner;
		
ds_list_add(pageObjects, item);

//Create back button
var _h = sprite_get_height(object_get_sprite(obj_slot_back));
var item = instance_create_layer(owner.x + 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_back);
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