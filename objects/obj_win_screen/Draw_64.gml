/// @description
//Alpha
draw_set_alpha((100 - offset) / 100);

	//Player render
	//shader_set(shd_palette);
	//shader_set_uniform_f_array(uni_s, palettes[0]);
	//shader_set_uniform_f_array(uni_r, palettes[color_index]);
	
	draw_sprite_ext(render, 0, -offset + (room_width / 1.5) -360, room_height / 2 - 270, 1, 1, 0, c_white, 1);
	
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
	var btn_names = get_button_names(global.device_number[0]);
	draw_set_font(fnt_consolas);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(room_width - 8, 8, stringify("Press {0} to save a replay", btn_names[| 2]));
}