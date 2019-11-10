///@description string_wrap
///@arg string
///@ max_width

var str = argument0;
var max_width = argument1;

var string_len = string_length(str)
var last_space = 1;

var count = 1;
var substr;

repeat(string_len)
{
	substr = string_copy(str, 1, count);
	if (string_char_at(str, count) == " ") last_space = count;
	
	if (string_width(substr) > max_width)
	{
		str = string_delete(str, last_space, 1);
		str = string_insert("\n", str, last_space);
		count += 1;
	}
	
	count++;
}

return str;