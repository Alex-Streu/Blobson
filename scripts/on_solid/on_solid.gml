///@func on_solid([x],[y]);
///@param [x]
///@param [y]
var _x, _y;
_x = argument_count > 0 ? argument[0] : x;
_y = argument_count > 1 ? argument[1] : y;

return (place_meeting(_x,_y+1,obj_solid));