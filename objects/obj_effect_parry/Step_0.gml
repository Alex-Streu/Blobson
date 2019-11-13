/// @description Insert description here
// You can write your code in this editor

if effect < 1
{
//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x; 
yp = y;
part_emitter_burst(parry1, global.pe_Effect2, global.pt_Effect2, 12);
part_emitter_region(parry1, global.pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_diamond, ps_distr_linear);
part_emitter_burst(parry1, global.pe_Effect1, global.pt_Effect1, 1);
part_emitter_region(parry1, global.pe_Effect1, xp-8, xp+8, yp-9, yp+7, ps_shape_rectangle, ps_distr_linear);
effect += 1;
}


