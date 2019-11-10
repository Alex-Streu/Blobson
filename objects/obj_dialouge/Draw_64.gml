/// @description Insert description here

//portrait
draw_sprite_ext(portrait,portrait_body_index,portrait_x,portrait_y,1,1,0,c_white,1)

//box
draw_sprite_ext(box,0,box_x,box_y,1,1,0,c_white,1)

//-----Text
if (!pause and counter < string_len )
{
	counter++;    
	if (counter mod 3 == 0)   {audio_play_sound(sfx_dialouge_text,10,false)}
	
	   switch(string_char_at(text_wrapped, counter))
	   {
		case ",": pause = true; alarm[1] = 30;   break;
		case ".": break; alarm[1] = 50; 
		case "?": break; alarm[1] = 50; 
		case "!": pause = true; alarm[1] = 50;  break;
	   }
	
	} //counter goes up by 1 and also plays a sound

var substring = string_copy(text_wrapped, 1, counter);


draw_set_font(dialouge_font);

draw_text_transformed_color(text_x,text_y, substring, 1, 1,0,c_white,c_white,c_white,c_white,1)