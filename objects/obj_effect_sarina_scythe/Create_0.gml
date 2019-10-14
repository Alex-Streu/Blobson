//Call this function to load Geon FX effect from file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you're OK with default Particle System

effect = 0;

//Put this code in Create event

//NewEffect Particle System
pe_sarina_attack = part_system_create();
part_system_depth(pe_sarina_attack, -1);




//sarina_attack Particle Types
//Sarina_attack
global.pt_Sarina_attack = part_type_create();
part_type_shape(global.pt_Sarina_attack, pt_shape_disk);
part_type_size(global.pt_Sarina_attack, 1, 1, 0, 0.50);
part_type_scale(global.pt_Sarina_attack, 0.05, 0.05);
part_type_orientation(global.pt_Sarina_attack, -347, 15, 0, 0, 0);
part_type_color3(global.pt_Sarina_attack, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_Sarina_attack, 1, 0.51, 0);
part_type_blend(global.pt_Sarina_attack, 0);
part_type_life(global.pt_Sarina_attack, 30, 96);
part_type_speed(global.pt_Sarina_attack, 3, 3, 0, 0);
part_type_direction(global.pt_Sarina_attack, 0, 180, 0, 50);
part_type_gravity(global.pt_Sarina_attack, 0.10, 270);

//sarina_attack Emitters
global.pe_Sarina_attack = part_emitter_create(pe_sarina_attack);

//sarina_attack emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(pe_sarina_attack, global.pe_Sarina_attack, global.pt_Sarina_attack, 32);
part_emitter_region(pe_sarina_attack, global.pe_Sarina_attack, xp-64, xp+64, yp-64, yp+64, ps_shape_ellipse, ps_distr_linear);

alarm_set(0,30);
//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Sarina_attack);

image_alpha = 0

