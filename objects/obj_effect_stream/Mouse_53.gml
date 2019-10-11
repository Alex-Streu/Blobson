if geon_effect_is_streamed(effect[sel]) geon_effect_stream(effect[sel], mouse_x, mouse_y, 0);
sel += 1;
if sel >= array_length_1d(effect) sel = 0;

