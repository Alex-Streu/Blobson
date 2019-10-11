//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = mouse_x;
yp = mouse_y;
part_emitter_region(global.ps, global.pe_rain, xp-254, xp+280, yp-538, yp-528, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_rain, global.pt_rain, 1);
part_emitter_region(global.ps, global.pe_vapor, xp-311, xp+311, yp-3, yp+5, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_vapor, global.pt_vapor, -13);

