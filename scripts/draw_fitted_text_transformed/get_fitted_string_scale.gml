///@func get_fitted_string_scale(string, width, font, padding?)
///@param string
///@param width
///@param size
///@param padding
var arg = 0;
var text = argument[arg++];
var width = argument[arg++];
var font = argument[arg++];
var padding = argument_count >= arg ? argument[arg++] : 5;

draw_set_font(font);
var strWidth = string_width(text);

var scale = (width - padding) / strWidth;

return scale;