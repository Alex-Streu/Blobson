/// @description Create pages

// Inherit the parent event
event_inherited();

#region Page Creation

//Create text field
var textField = instance_create_layer(hcenter_item(owner.x, owner.sprite_width, sprite_get_width(object_get_sprite(obj_slot_text_field))), owner.y + 10, "MenuLayer", obj_slot_text_field);
textField.owner = owner;
textField.type = TEXT_FIELD_TYPE.CONFIG;
		
ds_list_add(pageObjects, textField);

//Draw settings
var padding = 5;
var col1 = (owner.sprite_width) / 2 - (sprite_get_width(object_get_sprite(obj_slot_add_text))*3 + padding*2) / 2
var col2 = col1 + sprite_get_width(object_get_sprite(obj_slot_add_text)) + padding;
var col3 = col2 + sprite_get_width(object_get_sprite(obj_slot_add_text)) + padding;
var startY = 50;

//Create text items
for (var i = 0; i < array_length_1d(characters); i++)
{
	var startX = i % 3 == 0 ? col1 : (i % 3 == 1 ? col2 : col3);
	var item = instance_create_layer(owner.x + startX, owner.y + startY + (floor(i/3) * (sprite_get_height(object_get_sprite(obj_slot_add_text)) + padding)), "MenuLayer", obj_slot_add_text);
	item.owner = owner;
	item.characters = characters[i];
	item.display = characterDisplays[i];
	item.field = textField;
		
	ds_list_add(pageObjects, item);
	
	if (i+1 == array_length_1d(characters))
	{
		i++;
		var startX = i % 3 == 0 ? col1 : (i % 3 == 1 ? col2 : col3);
		var item = instance_create_layer(owner.x + startX, owner.y + startY + (floor(i/3) * (sprite_get_height(object_get_sprite(obj_slot_add_text)) + padding)), "MenuLayer", obj_slot_delete_text);
		item.owner = owner;
		item.field = textField;
		
		ds_list_add(pageObjects, item);
	}
}

//Create back button
var _h = sprite_get_height(object_get_sprite(obj_slot_back));
var item = instance_create_layer(owner.x + 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_back);
item.owner = owner;
		
ds_list_add(pageObjects, item);

//Create save config
var _w = sprite_get_width(object_get_sprite(obj_slot_config_save));
var _h = sprite_get_height(object_get_sprite(obj_slot_config_save));
var item = instance_create_layer(owner.x + owner.sprite_width - _w - 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_config_save);
item.owner = owner;
item.field = textField;

ds_list_add(pageObjects, item);

#endregion