//Playing previously loaded effect once
//geon_effect_burst(effect_explosion, mouse_x, mouse_y);

var xcenter = room_width/2;
var ycenter = room_height/2;
var mouse_dir = point_direction(xcenter, ycenter, mouse_x, mouse_y);
mouse_dir -= 180;
var xp = xcenter + lengthdir_x(300, mouse_dir);
var yp = ycenter + lengthdir_y(300, mouse_dir);

var dir = point_direction(xp, yp, mouse_x, mouse_y);
geon_effect_burst(effect_asteroid, xp, yp, [dir, dir]);


