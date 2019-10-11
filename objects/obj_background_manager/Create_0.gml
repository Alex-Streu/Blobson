/// @description DEFINE BACKGROUNDS
if room = rm_Stadium or rm_Dreamland
{
background = 
	[
		background_define(spr_background_arena_main, 0, 0, 1, .2, .2, 0, 0),
		//background_define(back_battlefield_clouds, 0, 0, 1, 0, 0, 0.1, 0),
		//background_define(back_battlefield_floating, 0, 0, 1, 0.5, 0.5, 0, 0),
		//background_define(back_battlefield_clouds, 0, 0, 1.2, 0, 0, 0.5, 0),
		[back_clear],
	];
}

if room = rm_Training or instance_exists(obj_crushrush)
{
background = 
	[
		background_define(spr_bg_trainingA, 0, 0, 1, .1, .1, 0, 0),
		background_define(spr_bg_trainingB, 0, 0, 1, .1, .1, 0, 0),
		background_define(spr_bg_trainingC, 0, 0, 1, .1, .1, 0, 0),
		//background_define(back_battlefield_clouds, 0, 0, 1.2, 0, 0, 0.5, 0),
		[back_clear],
	];
}

half_room_width = room_width / 2;
half_room_height = room_height/ 2;

//Special Effects
background_clear_frame = 0;
background_clear_amount = 0;
background_clear_color = c_white;
uni_black = shader_get_uniform(shd_fade, "fade_amount");

//Layer fade
layer_script_begin("Assets", Layer_Fade_Begin);
layer_script_end("Assets", Layer_Fade_End);