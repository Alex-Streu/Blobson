///@func palette_get_color(palette,index)
///@param palette
///@param index
var _pal = argument[0];
var _in = argument[1] * 4;
return make_color_rgb(_pal[_in] * 255, _pal[_in+1] * 255, _pal[_in+2] * 255);