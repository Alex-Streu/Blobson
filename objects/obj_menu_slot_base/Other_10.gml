/// @description Create pages

// Inherit the parent event
event_inherited();

allowCharacterSelect = true;


page = ds_list_create();
var startX = owner.x;
var startY = owner.y;

#region Main Page Creation

//Slot profile
var profile = instance_create_layer(startX, startY, "MenuLayer", obj_slot_profile);
profile.owner = owner;
profile.selected = owner.profile;
ds_list_add(pageObjects, profile);

//Slot config
var config = instance_create_layer(startX + sprite_get_width(object_get_sprite(obj_slot_profile)), startY, "MenuLayer", obj_slot_config);
config.owner = owner;
config.selected = owner.config;
ds_list_add(pageObjects, config);

//Slot portrait
var portrait = instance_create_layer(startX + sprite_get_width(object_get_sprite(obj_character_select_slot))/2 - sprite_get_width(object_get_sprite(obj_slot_portrait))/2, startY + sprite_get_height(object_get_sprite(obj_slot_profile)), "MenuLayer", obj_slot_portrait);
portrait.owner = owner;
ds_list_add(pageObjects, portrait);

#endregion