/// @description DEFINE BACKGROUNDS
if room = rm_Dreamland
{
background = 
	[
		background_define(back_battlefield_distant,0,0,1,0,0,0,0),
		background_define(back_battlefield_clouds,0,0,1,0,0,0.1,0),
		background_define(back_battlefield_floating,0,0,1,0.5,0.5,0,0),
		background_define(back_battlefield_clouds,0,0,1.2,0,0,0.5,0),
		[back_clear],
	];

half_room_width = room_width / 2;
half_room_height= room_height/ 2;

//Special Effects
background_clear_frame=0;
background_clear_amount=0;
background_clear_color=c_white;
uni_black=shader_get_uniform(shd_black,"fade_amount");

//Layer fade
layer_script_begin("Assets",Layer_Fade_Begin);
layer_script_end("Assets",Layer_Fade_End);
}

/// @description DEFINE BACKGROUNDS
if room = rm_Rivals
{
background = 
	[
	    background_define(back_battlefield_clouds,0,0,1.2,0,0,0.5,0),
		background_define(spr_backgorund_arena_main,-320,-240,1,0.3,0.3,0,0),
		[back_clear],
	];

half_room_width = room_width;
half_room_height= room_height;

//Special Effects
background_clear_frame=0;
background_clear_amount=0;
background_clear_color=c_white;
uni_black=shader_get_uniform(shd_black,"fade_amount");

//Layer fade
layer_script_begin("Assets",Layer_Fade_Begin);
layer_script_end("Assets",Layer_Fade_End);
}

/// @description DEFINE BACKGROUNDS
if room = rm_Training
{
background = 
	[	    
		[back_clear],
	];

half_room_width = room_width;
half_room_height= room_height;

//Special Effects
background_clear_frame=0;
background_clear_amount=0;
background_clear_color=c_white;
uni_black=shader_get_uniform(shd_black,"fade_amount");

//Layer fade
layer_script_begin("Assets",Layer_Fade_Begin);
layer_script_end("Assets",Layer_Fade_End);
}