/// @description Insert description here
// You can write your code in this editor

if effect < 1
{
//sarina_attack emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(pe_sarina_attack, global.pe_Sarina_attack, global.pt_Sarina_attack, 16);
part_emitter_region(pe_sarina_attack, global.pe_Sarina_attack, xp-64, xp+64, yp-64, yp+64, ps_shape_ellipse, ps_distr_linear);

effect += 1;
}


