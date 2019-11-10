/// @description
clear = true;



offset = 256;

winner = global.win_screen_data_temp;

char = winner[PLAYER_DATA.character];
palettes = winner[PLAYER_DATA.palettes];
color_index = winner[PLAYER_DATA.color];
color = palette_get_color(palettes[color_index], 0);
render = winner[PLAYER_DATA.render];
victory_theme = winner[PLAYER_DATA.victory_theme];
text = winner[PLAYER_DATA.text];

#region dialouge variables
box_x = 0;
box_y = 440;
box = spr_dialouge_box;
box_width = sprite_get_width(box)

x_buffer = 16;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

text_max_width = box_width - (2*x_buffer);

map_string = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?';:|%()_/+-*=#$@";
dialouge_font = font_add_sprite_ext(spr_font2, map_string, true, -0);
draw_set_font(dialouge_font);
#endregion

#region Sarina Dialouge



sarina_eyes_x = offset;
sarina_eyes_x_offset = 0;
sarina_eyes_y_offset = 111;
sarina_eyes_y = sarina_eyes_y_offset;

sarina_mouth_x = offset;
sarina_mouth_x_offset = 0;
sarina_mouth_y_offset = 111;
sarina_mouth_y = 0 + sarina_mouth_y_offset;
#endregion

//Play winning theme of the charcater.
audio_play_sound(victory_theme,10,false); 

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
	
#region my custom effects bg
//NewEffect Particle System
ps = part_system_create();
part_system_depth(ps, -1);

//NewEffect Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_disk);
part_type_size(global.pt_Effect1, 1, 1, 0.20, 0.20);
part_type_scale(global.pt_Effect1, 0.10, 0.10);
part_type_orientation(global.pt_Effect1, -2, 358, 0, 0, 0);
part_type_color3(global.pt_Effect1, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_Effect1, 0, 1, 0);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 80, 80);
part_type_speed(global.pt_Effect1, 1, 2, 0, 0);
part_type_direction(global.pt_Effect1, -2, 359, 0, 0);
part_type_gravity(global.pt_Effect1, 0, 210);

//Effect2
global.pt_Effect2 = part_type_create();
part_type_shape(global.pt_Effect2, pt_shape_disk);
part_type_size(global.pt_Effect2, 1, 1, 0, 0.20);
part_type_scale(global.pt_Effect2, 0.10, 0.10);
part_type_orientation(global.pt_Effect2, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect2, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_Effect2, 0, 1, 0);
part_type_blend(global.pt_Effect2, 0);
part_type_life(global.pt_Effect2, 80, 80);
part_type_speed(global.pt_Effect2, 1, 1, 0, 0);
part_type_direction(global.pt_Effect2, 0, 360, 0, 0);
part_type_gravity(global.pt_Effect2, 0, 0);

//NewEffect Emitters
global.pe_Effect1 = part_emitter_create(ps);
global.pe_Effect2 = part_emitter_create(ps);

//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_stream(ps, global.pe_Effect2, global.pt_Effect2, 1);
part_emitter_region(ps, global.pe_Effect2, xp-960, xp+960, yp-540, yp+540, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(ps, global.pe_Effect1, global.pt_Effect1, 1);
part_emitter_region(ps, global.pe_Effect1, xp-960, xp+960, yp-540, yp+540, ps_shape_rectangle, ps_distr_linear);

//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Effect1);
//part_emitter_destroy(ps, global.pe_Effect2);
#endregion
