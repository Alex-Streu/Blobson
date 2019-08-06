///@func stringify(str, var[1...])
///@param string
///@param var[1...]
///@desc Allows string formatting to include variables

var _str = argument[0];

for (var i = 1; i < argument_count; i++)
{
	var _var = argument[i];
	_str = string_replace(_str, "{" + string(i-1) + "}", string(_var));
}

return _str;