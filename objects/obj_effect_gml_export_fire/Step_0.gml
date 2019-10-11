//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = mouse_x;
yp = mouse_y;
part_emitter_region(global.ps, global.pe_flame, xp-8, xp+8, yp-9, yp+7, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.ps, global.pe_flame, global.pt_flame, -2);
part_emitter_region(global.ps, global.pe_fireplace, xp-8, xp+8, yp-46, yp-30, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.ps, global.pe_fireplace, global.pt_fireplace, -8);
part_emitter_region(global.ps, global.pe_spark, xp-8, xp+8, yp-39, yp-23, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.ps, global.pe_spark, global.pt_spark, -3);
part_emitter_region(global.ps, global.pe_smoke, xp-7, xp+9, yp-126, yp-110, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.ps, global.pe_smoke, global.pt_smoke, -8);

