///@func create_palette_rba(color_rgb...)
///@param color_rgb...
///@desc Stores any number of colors in RGBA format. Max 10 colors
var _palette = []
var m = 0;
for(var i=0;i<argument_count;i++)
	{
	//R
	_palette[m  ] = (argument[i] >> 16 & $FF) / $FF;
	//G
	_palette[m+1] = (argument[i] >> 8 & $FF) / $FF;
	//B
	_palette[m+2] = (argument[i] & $FF) / $FF;
	//A
	_palette[m+3] = 1.0;
	
	m+=4;
	}
return _palette;