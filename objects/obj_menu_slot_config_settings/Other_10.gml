/// @description Create pages

// Inherit the parent event
event_inherited();

//Top page title
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, 15 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = titles[pageIndex];
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

switch (pageIndex)
{
	case 0:
		#region Settings Page
		
		//Draw settings
		var textColumn = owner.sprite_width / 3 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (sprite_get_width(object_get_sprite(obj_slot_config_switch)) / 2) + 10;

		//Create Tap Jump row
		var startY = 50;
		var item = ds_map_create();
		item[? "Position"] = [ textColumn, startY ];
		item[? "Type"] = MENU_ITEM_TYPE.TEXT;
		item[? "Text"] = "TAP JUMP";
		item[? "Font"] = fnt_consolas;
		item[? "HAlign"] = fa_center;
		ds_list_add(page, item);
		
		item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_switch);
		item.owner = owner;
		item.name = "TapJump";
		ds_list_add(pageObjects, item);


		//Create Rumble row
		startY += 40;
		item = ds_map_create();
		item[? "Position"] = [ textColumn, startY ];
		item[? "Type"] = MENU_ITEM_TYPE.TEXT;
		item[? "Text"] = "RUMBLE";
		item[? "Font"] = fnt_consolas;
		item[? "HAlign"] = fa_center;
		ds_list_add(page, item);
		
		item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_switch);
		item.owner = owner;
		item.name = "Rumble";
		ds_list_add(pageObjects, item);
		
		
		//Create Reset button
		item = instance_create_layer(hcenter_item(owner.x, owner.sprite_width, sprite_get_width(object_get_sprite(obj_slot_config_reset))), owner.y + 120, "MenuLayer", obj_slot_config_reset);
		item.owner = owner;
		ds_list_add(pageObjects, item);
		
		
		#endregion
	break;
}

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

//Load config settings
var _config = owner.config;
with (obj_slot_config_setting)
{
	setting = _config[? name];
}