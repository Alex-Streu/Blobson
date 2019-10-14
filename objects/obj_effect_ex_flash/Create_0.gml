//Call this function to load Geon FX effect from file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you're OK with default Particle System

effect = 0;

//Put this code in Create event

//NewEffect Particle System
pe_ex_flash = part_system_create();
part_system_depth(pe_ex_flash, -1);

//ex_flash Particle Types
//star_effect
global.pt_star_effect = part_type_create();
part_type_shape(global.pt_star_effect, pt_shape_star);
part_type_size(global.pt_star_effect, 1, 1, 0, 0.50);
part_type_scale(global.pt_star_effect, 0.10, 0.10);
part_type_orientation(global.pt_star_effect, -347, 15, 0, 0, 0);
part_type_color3(global.pt_star_effect, 65535, 8978431, 16777215);
part_type_alpha3(global.pt_star_effect, 1, 0.51, 0);
part_type_blend(global.pt_star_effect, 0);
part_type_life(global.pt_star_effect, 30, 96);
part_type_speed(global.pt_star_effect, 3, 3, 0, 0);
part_type_direction(global.pt_star_effect, 0, 180, 0, 50);
part_type_gravity(global.pt_star_effect, 0, 89);


//ex_flash
global.pt_ex_flash = part_type_create();
part_type_shape(global.pt_ex_flash, pt_shape_pixel);
//spr_flash rosa 2 long_strip15 = sprite_add("flash rosa 2 long_strip15.png", 15, 0, 0, 41, 61);
part_type_sprite(global.pt_ex_flash, spr_fx_ex_flash, 1, 0, 0);
part_type_size(global.pt_ex_flash, 1, 1, 0, 0);
part_type_scale(global.pt_ex_flash, 1, 1);
part_type_orientation(global.pt_ex_flash, 0, 0, 0, 0, 0);
part_type_color3(global.pt_ex_flash, 65535, 8454143, 65535);
part_type_alpha3(global.pt_ex_flash, 1, 1, 1);
part_type_blend(global.pt_ex_flash, 0);
part_type_life(global.pt_ex_flash, 15, 15);
part_type_speed(global.pt_ex_flash, 0, 0, 0, 0);
part_type_direction(global.pt_ex_flash, 0, 360, 0, 0);
part_type_gravity(global.pt_ex_flash, 0, 91);

//sarina_attack Emitters
global.pe_star_effect = part_emitter_create(pe_ex_flash);
global.pe_ex_flash = part_emitter_create(pe_ex_flash);

//ex_flash emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(pe_ex_flash, global.pe_ex_flash, global.pt_ex_flash, 1);
part_emitter_region(pe_ex_flash, global.pe_ex_flash, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(pe_ex_flash, global.pe_star_effect, global.pt_star_effect, 32);
part_emitter_region(pe_ex_flash, global.pe_star_effect, xp-32, xp+32, yp-32, yp+32, ps_shape_ellipse, ps_distr_linear);

alarm_set(0,30);
//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Sarina_attack);

image_alpha = 0

