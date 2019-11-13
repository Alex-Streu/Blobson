//Call this function to load Geon FX effect from file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you're OK with default Particle System

effect = 0;

//Put this code in Create event

//NewEffect Particle System
parry1 = part_system_create();
part_system_depth(parry1, -100);

//NewEffect Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_pixel);
//sprite_add("mike's effect hitup or parry 2x frames_strip12.png", 12, 0, 0, 44, 146);
part_type_sprite(global.pt_Effect1, spr_fx_parry1, 1, 0, 0);
part_type_size(global.pt_Effect1, 1, 1, 0, 0);
part_type_scale(global.pt_Effect1, 1, 1);
part_type_orientation(global.pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect1, 16777215, 16776960, 9192960);
part_type_alpha3(global.pt_Effect1, 1, 1, 1);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 12, 12);
part_type_speed(global.pt_Effect1, 0, 0, 0, 0);
part_type_direction(global.pt_Effect1, 0, 360, 0, 0);
part_type_gravity(global.pt_Effect1, 0, 0);

//Effect2
global.pt_Effect2 = part_type_create();
part_type_shape(global.pt_Effect2, pt_shape_star);
part_type_size(global.pt_Effect2, 0.50, 0.50, 0, 0);
part_type_scale(global.pt_Effect2, 0.30, 0.30);
part_type_orientation(global.pt_Effect2, -355, 263, 57, 0, 0);
part_type_color3(global.pt_Effect2, 16777088, 16777088, 16777088);
part_type_alpha3(global.pt_Effect2, 1, 0.49, 0);
part_type_blend(global.pt_Effect2, 0);
part_type_life(global.pt_Effect2, 30, 60);
part_type_speed(global.pt_Effect2, 5, 15, 0, 0);
part_type_direction(global.pt_Effect2, 63, 118, 0, 0);
part_type_gravity(global.pt_Effect2, 1, 270);

//NewEffect Emitters
global.pe_Effect1 = part_emitter_create(parry1);
global.pe_Effect2 = part_emitter_create(parry1);

//NewEffect emitter positions. Streaming or Bursting Particles.
//add me to step event
var xp, yp;
xp = x; 
yp = y;
part_emitter_burst(parry1, global.pe_Effect2, global.pt_Effect2, 12);
part_emitter_region(parry1, global.pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_diamond, ps_distr_linear);
part_emitter_burst(parry1, global.pe_Effect1, global.pt_Effect1, 1);
part_emitter_region(parry1, global.pe_Effect1, xp-8, xp+8, yp-9, yp+7, ps_shape_rectangle, ps_distr_linear);

image_alpha = 0


//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Effect1);
//part_emitter_destroy(ps, global.pe_Effect2);