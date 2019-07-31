/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	//Tethering
	if (state==PLAYER_STATE.ledge_tether)
		{
		var _accent = palette_get_color(palettes[player_color],1);
		draw_line_width_color(x,y,ledge_id.x,ledge_id.y,2,_accent,_accent);
		}
	//Shader for player graphics
	var _light = 0.0, _alpha = 1.0;
	if (invulnerable_type=INV.type_invincible)
		{
		_light = 0.2;
		_alpha = 0.5;
		}
	shader_set(shd_player);
	shader_set_uniform_f(uni_l,_light);
	shader_set_uniform_f(uni_a,_alpha);
	shader_set_uniform_f(uni_f,fade_value);
	
	// v include these two if new palette system doesn't work
	//shader_set_uniform_f_array(uni_s,palettes[0]);
	//shader_set_uniform_f_array(uni_r,palettes[player_color]);
	
	
	//Draw
	if (anim_sprite!=-1)
		{
		pal_swap_set(my_pal_sprite,current_pal,false); //remove if new palette system is odd or doesnt work
		Draw_Anim_Sprite(anim_sprite,floor(anim_frame),facing,x,y,sprite_scale);
        pal_swap_reset(); //remove if new palette system is odd or doesnt work
		}
	//Shaders
	shader_reset();
	//Shielding
	if (state==PLAYER_STATE.shielding)
		{
		draw_sprite_ext(spr_shield,0,x,y,shield_hp/shield_max_hp,shield_hp/shield_max_hp,0,image_blend,image_alpha);
		}
	//Respawning
	if (state==PLAYER_STATE.respawning)
		{
		draw_sprite_ext(spr_respawn_platform,0,x,bbox_bottom,sprite_scale,sprite_scale,0,image_blend,image_alpha);
		}
	//Attack Drawing
	if (attack_draw_script!=-1 && script_exists(attack_draw_script))
		{
		script_execute(attack_draw_script);
		}
	/* DEBUG */
	if (show_collision_boxes)
		{
		draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,collision_box_draw_color,image_alpha);
		}
	if (debug)
		{
		draw_set_font(fnt_consolas);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		//Current State
		draw_text(x,y-80,string(state));
		//X and Y
		draw_text(x-32,y-120,string(x));
		draw_text(x+32,y-120,string(y));
		//Draw hitbox group lists
		for(var i = 0; i < ds_list_size(collided); i++)
			{
			for(var m = 0; m < ds_list_size(collided[| i]); m++)
				{
				draw_text(x + 48, y + m * 32, collided[| i]);
				}
			}
		//Control stick
		draw_circle(x,y,46,true);
		draw_circle(x+control_xvalue_l*46,y+control_yvalue_l*46,6,false);
		/*
		//Previous states
		for(var i=0;i<ds_list_size(state_log);i++)
			{
			draw_text(x,y-96-16*i,string(state_log[| i]));
			}
		//*/
		}
	if (game_surface_enable) surface_reset_target();
	}
	