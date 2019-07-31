///@func background_define(sprite,xoff,yoff,scale,move_x,move_y,[xspd],[yspd])
///@param sprite
///@param xoff
///@param yoff
///@param scale
///@param move_x
///@param move_y
///@param [xspd]
///@param [yspd]

var _new = array_create(BACK.length);

_new[BACK.sprite] = argument[0];
_new[BACK.x] = argument[1];
_new[BACK.y] = argument[2];
_new[BACK.scale] = argument[3];
_new[BACK.parallax_x] = argument[4];
_new[BACK.parallax_y] = argument[5];
_new[BACK.xspd] = argument_count > 6 ? argument[6] : 0;
_new[BACK.yspd] = argument_count > 7 ? argument[7] : 0;

return _new;