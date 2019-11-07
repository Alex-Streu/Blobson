/// @description Create page

// Inherit the parent event
event_inherited();

var _switch = instance_create_layer(owner.x + owner.sprite_width - sprite_get_width(object_get_sprite(obj_slot_switch)) - 10, owner.y + owner.sprite_height - sprite_get_height(object_get_sprite(obj_slot_switch)) - 10, "MenuLayer", obj_slot_switch);
_switch.owner = owner;

ds_list_add(pageObjects, _switch);