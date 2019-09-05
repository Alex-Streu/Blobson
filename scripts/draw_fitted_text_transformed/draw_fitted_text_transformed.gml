///@func draw_fitted_text_transformed(x, y, string, angle, width, padding?)
///@param x
///@param y
///@param string
///@param angle
///@param width
///@param padding?
var arg = 0;
var xx = argument[arg++];
var yy = argument[arg++];
var text = argument[arg++];
var angle = argument[arg++];
var width = argument[arg++];
var padding = argument_count > arg ? argument[arg++] : 5;

var strWidth = string_width(text);

var scale = (width - 2*padding) / strWidth;

draw_text_transformed(xx, yy, text, scale, scale, angle);