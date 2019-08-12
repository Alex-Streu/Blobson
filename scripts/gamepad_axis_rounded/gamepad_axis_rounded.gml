///@func gamepad_axis_rounded(device,axisIndex)
///@param device
///@param axisIndex
var _new = round(gamepad_axis_value(argument[0], argument[1]) * 100 ) * 0.01;
return _new;