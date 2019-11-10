/// @description Status / Frame Advance

//Draw player status
var _fade = (1 - obj_background_manager.background_clear_amount);
for(var i = 0; i < number_of_players; i++)
{
	//Skip if player doesn't exist	
	//var _player = instance_find(obj_player, instance_number(obj_player)-1 - i);
	var _player = players[i];
	if (_player == noone) { continue; }
	
	//Get accent color
	var _accent = c_white;
	_accent = palette_get_color(_player.palettes[_player.player_color], 0);
	
	//Character profile sprite
	draw_sprite_ext(spr_player_status,1,status_bar_space * (i + 1) + player_status_x,player_status_y,1,1,0,_accent,_fade); //color beneath	
	
	
	#region Ex meter level 0 - bar 1 - drawing the line
	if _player.EX_meter  >= 0
	if _player.EX_meter  < 50
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter, //x2
		player_status_y + 59, //y2
	    ex_level0_color, 
	    ex_level0_color, 
	    ex_level0_color, 
	    ex_level0_color,
	    false 
	    ); //EX METER
        #endregion
	#region EX meter level 0 drawing the bar sprite
		if _player.EX_meter  >= 50
		if _player.EX_meter  <	100
		{
        draw_sprite_ext(spr_hype_meter,1,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,ex_level0_color,_fade); //bar color
		draw_sprite_ext(spr_hype_meter,0,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,c_white,_fade); //hype sign
		}
	#endregion	
	#region Ex meter level 0 - bar 2 - drawing the line
	if _player.EX_meter  >= 50
	if _player.EX_meter  < 100
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + 56, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter + 6, //x2
		player_status_y + 59, //y2
	    ex_level0_color, 
	    ex_level0_color, 
	    ex_level0_color, 
	    ex_level0_color,
	    false 
	    ); //EX METER
        #endregion
	
	#region Ex meter level 1 - bar 1 - drawing the line
	if _player.EX_meter  >= 100
	if _player.EX_meter  < 150
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter - 100, //x2
		player_status_y + 59, //y2
	    ex_level1_color, 
	    ex_level1_color, 
	    ex_level1_color, 
	    ex_level1_color,
	    false 
	    ); //EX METER
        #endregion
	#region EX meter level 1 drawing the bar sprite
		if _player.EX_meter  >= 150
		if _player.EX_meter  <	200
		{
        draw_sprite_ext(spr_hype_meter,1,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,ex_level1_color,_fade); //bar color
		draw_sprite_ext(spr_hype_meter,0,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,c_white,_fade); //hype sign
		}
	#endregion	
	#region Ex meter level 1 - bar 2 - drawing the line
	if _player.EX_meter  >= 150
	if _player.EX_meter  < 200
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + 56, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter - 100 + 6, //x2
		player_status_y + 59, //y2
	    ex_level1_color, 
	    ex_level1_color, 
	    ex_level1_color, 
	    ex_level1_color,
	    false 
	    ); //EX METER
        #endregion
	
	#region Ex meter level 2 - bar 1 - drawing the line
	if _player.EX_meter  >= 200
	if _player.EX_meter  < 250
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter - 200, //x2
		player_status_y + 59, //y2
	    ex_level2_color, 
	    ex_level2_color, 
	    ex_level2_color, 
	    ex_level2_color,
	    false 
	    ); //EX METER
        #endregion
	#region EX meter level 2 - bar 1 - drawing the bar sprite
		if _player.EX_meter  >= 250
		if _player.EX_meter  <	300
		{
        draw_sprite_ext(spr_hype_meter,1,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,ex_level2_color,_fade); //bar color
		draw_sprite_ext(spr_hype_meter,0,status_bar_space * (i + 1) + player_status_x + ex_meter_sprite_x,player_status_y + ex_meter_sprite_y,1,1,0,c_white,_fade); //hype sign
		}
	#endregion
	#region Ex meter level 2 - bar 2 - drawing the line
	if _player.EX_meter  >= 250
	if _player.EX_meter  < 300
	if _fade = 1
	draw_rectangle_colour(
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + 56, //x1
		player_status_y + 36, //y1
		status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter - 200 + 6, //x2
		player_status_y + 59, //y2
	    ex_level2_color, 
	    ex_level2_color, 
	    ex_level2_color, 
	    ex_level2_color,
	    false 
	    ); //EX METER
        #endregion
	
	
	
	draw_sprite_ext(spr_player_status,0,status_bar_space * (i + 1) + player_status_x,player_status_y,1,1,0,_accent,_fade); //boarder
		
	//shader_set(shd_palette);
	//shader_set_uniform_f_array(uni_s, _player.palettes[0]);
	//shader_set_uniform_f_array(uni_r, _player.palettes[_player.player_color]);
	
	pal_swap_set(_player.my_portrait_pal_sprite,_player.current_pal,false); //remove if new palette system is odd or doesnt work
	draw_sprite_ext(_player.portrait,0,status_bar_space * (i + 1) + player_status_x + 6 ,player_status_y + 6,1,1,0,c_white,round(_fade));//portrait
		
		//round so the replacement shader still works		
		//alternate way would be to draw to surfaces and then draw the surfaces with alpha
	for(var m = 0; m < _player.stock; m++)
	{
		draw_sprite_ext(_player.stock_sprite,0,status_bar_space * (i + 1) + (m * 24) + 48,player_status_y - 24,1,1,0,_accent,round(_fade) );
	}
	shader_reset();
	//draw_sprite_ext(spr_player_status,1,status_bar_space * (i + 1) + (m * 32) + 184 + player_status_x,player_status_y,1,1,0,_accent,_fade)
	
	
	//hype levels font
	draw_sprite_ext(spr_hype_meter_levels,_player.EX_level,status_bar_space * (i + 1) + player_status_x + 128,player_status_y + 6,1,1,0,c_white,_fade); //color beneath
	
	//draw meter counter
	//draw_text_ext_transformed_color(124 + status_bar_space * (i + 1), player_status_y + 12,  "EX: " + string(_player.EX_meter), 32,156,.4,.4,0,c_white,c_white,c_white,c_white,_fade);
	
	
	//Lives counter
	//draw_text_ext_transformed_color(208 + status_bar_space * (i + 1), player_status_y - 18, string(_player.stock), 32,32,1,1,0,c_white,c_white,c_white,c_white,_fade);
	//
	//Damage	
	draw_text_sprite(64 + status_bar_space * (i + 1) + player_status_x,player_status_y +16,string(_player.damage),spr_damage_font,16, _player.damage_text_x,_player.damage_text_y,.8,calculate_damage_color(_player.damage),_fade);

	
	

//Startup sequence
if (countdown > 0)
	{
	//Countdown
	var _frame = countdown div count_time;
	var _scale = lerp(2.2, 2, (countdown % count_time) / count_time);
	var _alpha = lerp(0, 1, (countdown % count_time) / count_time);
	draw_sprite_ext(spr_countdown, _frame, camera_width div 2, camera_height div 2, _scale, _scale, 0, c_white, _alpha);
	}

//Frame Advance
if (state == GAME_STATE.paused)
	{
	draw_set_font(fnt_consolas);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text(32, 16, "Press Start to advance the game");
	draw_text(32, 32, "Total Frames: " + string(current_frame));
	draw_text(32, 48, "Frame Number: " + string(frames_advanced));
	}
}