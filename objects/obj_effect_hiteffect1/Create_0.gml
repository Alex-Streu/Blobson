//Call this function to load Geon FX effect from file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you're OK with default Particle System
effect_explosion = geon_effect_add("geon_fx/effects/explosion.geon", -1);
effect_asteroid = geon_effect_add("geon_fx/effects/asteroid_burst.geon", -1);

effect_fire = geon_effect_add("geon_fx/effects/car_fire.geon", -1, [spr_car_fire_flash, -1, -1, -1, -1, spr_car_fire_dust])

//hit effects Particle System
ps = part_system_create();
part_system_depth(ps, -1);

//hit effects Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_circle);
//spr_7px diamond = sprite_add("7px diamond.png", 1, 0, 0, 3, 3);
part_type_sprite(global.pt_Effect1, spr_geon_hit1b, 1, 0, 0);
part_type_size(global.pt_Effect1, 1, 1, 0, 0);
part_type_scale(global.pt_Effect1, 1, 1);
part_type_orientation(global.pt_Effect1, -358, 239, 0, 0, 0);
part_type_color3(global.pt_Effect1, 16744448, 16777215, 16777215);
part_type_alpha3(global.pt_Effect1, 1, 0.51, 0);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 30, 50);
part_type_speed(global.pt_Effect1, 1, 10, 0, 0);
part_type_direction(global.pt_Effect1, 0, 182, 0, 0);
part_type_gravity(global.pt_Effect1, 0.30, 264);

//Effect2
global.pt_Effect2 = part_type_create();
part_type_shape(global.pt_Effect2, pt_shape_spark);
//spr_mike hit 1_strip20 = sprite_add("mike hit 1_strip20.png", 20, 0, 0, 138, 82);
part_type_sprite(global.pt_Effect2, spr_geon_hit1, 1, 0, 0);
part_type_size(global.pt_Effect2, 1, 1, 0, 0);
part_type_scale(global.pt_Effect2, 1, 1);
part_type_orientation(global.pt_Effect2, 0, 353, 0, 0, 1);
part_type_color3(global.pt_Effect2, 16763541, 16777215, 16777215);
part_type_alpha3(global.pt_Effect2, 1, 1, 1);
part_type_blend(global.pt_Effect2, 0);
part_type_life(global.pt_Effect2, 20, 20);
part_type_speed(global.pt_Effect2, 0, 0, 0, 0);
part_type_direction(global.pt_Effect2, 0, 360, 0, 0);
part_type_gravity(global.pt_Effect2, 0, 202);

//hit effects Emitters
global.pe_Effect1 = part_emitter_create(ps);
global.pe_Effect2 = part_emitter_create(ps);

//hit effects emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(ps, global.pe_Effect2, global.pt_Effect2, 1);
part_emitter_region(ps, global.pe_Effect2, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(ps, global.pe_Effect1, global.pt_Effect1, 10);
part_emitter_region(ps, global.pe_Effect1, xp-32, xp+32, yp-32, yp+32, ps_shape_ellipse, ps_distr_gaussian);

//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Effect1);
//part_emitter_destroy(ps, global.pe_Effect2);