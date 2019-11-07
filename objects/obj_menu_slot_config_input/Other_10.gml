/// @description Create pages

// Inherit the parent event
event_inherited();

#region Page Creation
//Help text
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, 30 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = "Press START to\nend input";
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

//Create input field
var inputField = instance_create_layer(hcenter_item(owner.x, owner.sprite_width, sprite_get_width(object_get_sprite(obj_slot_config_control_input))), owner.y + 50, "MenuLayer", obj_slot_config_control_input);
inputField.owner = owner;
inputField.name = owner.manageData[? "Name"];
inputField.setting = owner.manageData[? "Setting"];
show_debug_message(json_encode(owner.manageData))
ds_list_add(pageObjects, inputField);

//Create back button
var _h = sprite_get_height(object_get_sprite(obj_slot_back));
var item = instance_create_layer(owner.x + 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_back);
item.owner = owner;		
ds_list_add(pageObjects, item);

//Create clear input
var _w = sprite_get_width(object_get_sprite(obj_slot_delete_input));
var _h = sprite_get_height(object_get_sprite(obj_slot_delete_input));
var item = instance_create_layer(hcenter_item(owner.x, owner.sprite_width, _w), owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_delete_input);
item.owner = owner;
item.field = inputField;
ds_list_add(pageObjects, item);

//Create save input
var _w = sprite_get_width(object_get_sprite(obj_slot_config_input_save));
var _h = sprite_get_height(object_get_sprite(obj_slot_config_input_save));
var item = instance_create_layer(owner.x + owner.sprite_width - _w - 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_config_input_save);
item.owner = owner;
item.field = inputField;
ds_list_add(pageObjects, item);

#endregion