/// @description
//Input Buffer DEBUG
if (debug)
	{
	var start_x=controller*(ds_list_size(input_buffer)*5);
	var c=c_white;
	for(var i=0;i<ds_list_size(input_buffer);i++)
		{
		c=make_color_hsv(i*9,255,255);
		draw_rectangle_color(start_x+i*4,0,start_x+2+i*4,input_buffer[|i]*2,c,c,c,c,false);
		} 
	draw_text(128*controller,48,"Fade:" + string(fade_value));
	}