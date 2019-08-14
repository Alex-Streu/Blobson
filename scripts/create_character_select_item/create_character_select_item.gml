///@func create_character_select_item(name, script, icon, portrait, x, y)
///@param name
///@param script
///@param icon
///@param portrait
///@param x
///@param y
///@desc Creates a character select item

var _name = argument[0];
var _script = argument[1];
var _icon = argument[2];
var _portrait = argument[3];
var _x = argument[4];
var _y = argument[5];

var _item = instance_create_layer(_x, _y, "IconsLayer", obj_character_select_item);

with (_item) {
	name = _name;
	script = _script;
	icon = _icon;
	portrait = _portrait;
	iconW = sprite_get_width(icon);
	iconH = sprite_get_height(icon);
}

return _item;