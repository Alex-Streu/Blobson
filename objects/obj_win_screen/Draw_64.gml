/// @description
//Alpha
draw_set_alpha((100 - offset) / 100);

	//Player render
	//shader_set(shd_palette);
	//shader_set_uniform_f_array(uni_s, palettes[0]);
	//shader_set_uniform_f_array(uni_r, palettes[color_index]);
	
	//render
	//draw_sprite_ext(render, 0, -offset + (room_width / 1.5) -360, room_height / 2 - 273, 1, 1, 0, c_white, 1);
	
	#region Sarina Dialouge
	//pal_swap_set(winner.my_portrait_pal_sprite,winner.current_pal,false); //remove if new palette system is odd or doesnt work
	draw_sprite_ext(render, 0, -offset + (room_width / 1.5) +360,20, -1, 1, 0, c_white, 1);
	
	if text = "hm, looks like you weren't as strong as I thought... I'm sorry I expected more of you."
	{
	draw_sprite_ext(spr_sarina_dialouge_eyes, 2, -sarina_eyes_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_sarina_dialouge_mouths, 0, -sarina_mouth_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	}
	
	if text = "This is more than just fate, it's my destiny."
	{
	draw_sprite_ext(spr_sarina_dialouge_eyes, 0, -sarina_eyes_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_sarina_dialouge_mouths, 0, -sarina_mouth_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	}
	
	if text = "Looks like i win this fight. It was an honor."
	{
	draw_sprite_ext(spr_sarina_dialouge_eyes, 0, -sarina_eyes_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_sarina_dialouge_mouths, 3, -sarina_mouth_x + (room_width / 1.5) +360,0, -1, 1, 0, c_white, 1);
	}
	
	#endregion
	
	shader_reset();

	//Transformations
	shader_set(shd_position);

	draw_set_font(fnt_win);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom); //switch to top if it bugs out
	draw_text(50 + offset, room_height / 3, char);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom); //switch to top if it bugs out
	draw_text(55 + offset, room_height / 3 - 4, char);

	shader_reset();

//Reset
draw_set_alpha(1);

//Extra Text
if (global.replay_record)
{
	//var btn_names = get_button_names(global.device_number[0]);
	draw_set_font(fnt_consolas);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(room_width - 8, 8, "Press Y to save a replay");
}


//box
draw_sprite_ext(box,0,box_x,box_y,1,1,0,c_white,1)


draw_set_font(dialouge_font);
draw_set_halign(fa_left);
draw_set_valign(fa_left);
draw_text_ext_transformed_color(text_x,text_y, string(text), 40, text_max_width,1,1,0,c_white,c_white,c_white,c_white,1)
