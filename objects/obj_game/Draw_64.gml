/// @description Status / Frame Advance

//Draw player status
var _fade = (1 - obj_background_manager.background_clear_amount);
for(var i = 0; i < number_of_players; i++)
	{
	//Get accent color
	var _accent = c_white;
	var _player = instance_find(obj_player, instance_number(obj_player)-1 - i);
	_accent = palette_get_color(_player.palettes[_player.player_color], 0);
	//Character profile sprite
	draw_sprite_ext(spr_player_status,1,status_bar_space * (i + 1) + player_status_x,player_status_y,1,1,0,_accent,_fade); //color beneath
	
	//EX METER
	draw_rectangle_colour(
	status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x, //x1
	player_status_y + 88, //y1
	status_bar_space * (i + 1) + player_status_x + ex_meter_ui_x + _player.EX_meter, //x2
	player_status_y + 110, //y2
	c_white, 
	c_white, 
	c_white, 
	c_white,
	false 
	); //EX METER
	
	draw_sprite_ext(spr_player_status,0,status_bar_space * (i + 1) + player_status_x,player_status_y,1,1,0,_accent,_fade); //boarder
	
	//shader_set(shd_palette);
	//shader_set_uniform_f_array(uni_s, _player.palettes[0]);
	//shader_set_uniform_f_array(uni_r, _player.palettes[_player.player_color]);
	
	pal_swap_set(my_portrait_pal_sprite,_player.current_pal,false); //remove if new palette system is odd or doesnt work
	draw_sprite_ext(_player.portrait,0,status_bar_space * (i + 1) + player_status_x,player_status_y,1,1,0,c_white,round(_fade));
                     //round fade so the replacement shader still works
					//alternate way would be to draw to surfaces and then draw the surfaces with alpha			
        pal_swap_reset(); //remove if new palette system is odd or doesnt work
		
		
					
					
		
	for(var m = 0; m < _player.stock; m++)
		{
		draw_sprite_ext(_player.stock_sprite,0,status_bar_space * (i + 1) + (m * 32) + 184 + player_status_x,player_status_y + 20,1,1,0,c_white,round(_fade) );
		}
	shader_reset();
	//Damage
	draw_text_sprite
      (
		46 + status_bar_space * (i + 1),
		player_status_y,
		string(_player.damage),
		spr_damage_font,
		24, //38
		_player.damage_text_x + 164 + player_status_x,
		_player.damage_text_y + 72,
		1,
		calculate_damage_color(_player.damage),
		_fade
		);
	}

//Startup sequence
if (countdown > 0)
	{
	//Countdown
	var _frame = countdown div 60;
	var _scale = lerp(2.2, 2, (countdown % 60) / 60);
	var _alpha = lerp(0, 1, (countdown % 60) / 60);
	draw_sprite_ext(spr_countdown, _frame, cam_w div 2, cam_h div 2, _scale, _scale, 0, c_white, _alpha);
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