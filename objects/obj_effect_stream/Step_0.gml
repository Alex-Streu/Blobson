if mouse_wheel_up() dir -= 5;
if mouse_wheel_down() dir += 5;
if dir > 359 dir = 0;
if dir < 0 dir = 359;

//Playing previously loaded effect as a stream. To stop Playing just set "stream" variable to 0.
//Now you can set direction, gravity direction, speed and gravity of effect as an argument (array)
geon_effect_stream(effect[sel], mouse_x, mouse_y, stream, [dir, dir]);

