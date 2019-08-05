///@func clamp_object_in_room(obj)
///@param object
///@desc Clamps an object into a room based on its sprite size

var _obj = argument[0];

var offX = sprite_get_xoffset(_obj.sprite_index);
var offY = sprite_get_yoffset(_obj.sprite_index);
var width = sprite_get_width(_obj.sprite_index);
var height = sprite_get_height(_obj.sprite_index);

var left = offX;
var right = room_width - width + offX;
var top = offY;
var bottom = room_height - height + offY;

_obj.x = clamp(_obj.x, left, right);
_obj.y = clamp(_obj.y, top, bottom);