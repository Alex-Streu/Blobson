///@func create_menu()

var _sizeX = argument[0];
var _sizeY = argument[1];

//HEADER
var _header = argument[2];
var _headerItems = _header[? "Items"];
var _headerSizeY = _header[? "SizeY"];
var _headerSizeX = _header[? "SizeX"];
var _headerHeight = array_height_2d(_headerItems);

for (var i = 0; i < _headerHeight; i++)
{
	var _headerLength = array_length_2d(_headerItems, i);
	var _printY = _headerSizeY / _headerHeight * (i+1);
	for (var j = 0; j < _headerLength; j++)
	{
		var _printX = _headerSizeX / _headerLength * (j+1);
		
		var _item = _headerItems[i, j];
		if (_item[? "Type"] == noone) { continue; }
	
		switch (_item[? "Type"])
		{
			case HEADER_TYPE.TEXT:
				show_debug_message("should draw text")
				draw_set_font(global.base_font);
				show_debug_message(stringify("{0}, {1} - {2}", _printX, _printY, _item[? "Text"]))
				draw_text_transformed(_printX, _printY, _item[? "Text"], 0.1, 0.1, 0);
				break;
		}
	}
}