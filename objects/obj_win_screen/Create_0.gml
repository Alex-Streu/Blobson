/// @description
clear = true;

offset = 100;

winner = global.win_screen_data_temp;

char = winner[PLAYER_DATA.character];
palettes = winner[PLAYER_DATA.palettes];
color_index = winner[PLAYER_DATA.color];
color = palette_get_color(palettes[color_index], 0);
render = winner[PLAYER_DATA.render];

//Replays
can_save_replay = global.replay_record;

//Shader uniforms
uni_s = shader_get_uniform(shd_palette, "sample");
uni_r = shader_get_uniform(shd_palette, "replace");

var _r = color_get_red	(color) / $FF;
var _g = color_get_green(color) / $FF;
var _b = color_get_blue	(color) / $FF;
var _d = 0.2;
Voronoi_Change_Color
	(
	[_r - random(_d), _r + random(_d)], 
	[_g - random(_d), _g + random(_d)], 
	[_b - random(_d), _b + random(_d)],
	);