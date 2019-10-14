/// @description Insert description here
// You can write your code in this editor

if effect < 1
{
//ex_flash emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(pe_ex_flash, global.pe_ex_flash, global.pt_ex_flash, 1);
part_emitter_region(pe_ex_flash, global.pe_ex_flash, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(pe_ex_flash, global.pe_star_effect, global.pt_star_effect, 32);
part_emitter_region(pe_ex_flash, global.pe_star_effect, xp-32, xp+32, yp-32, yp+32, ps_shape_ellipse, ps_distr_linear);

effect += 1;
}


