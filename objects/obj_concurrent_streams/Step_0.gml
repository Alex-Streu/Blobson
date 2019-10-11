var xp, yp, dis;

xp = mouse_x; //x
yp = mouse_y; //y

dis = 150 + geon_sin_shift(50, 3, 0, 0);

direction -= 1; //rotating our object

var effects = array_length_1d(effect_fire); //counting effects

for (var i = 0; i < effects; i += 1) //cycling through effects
{
    if keyboard_check_pressed( ord(string(i+1)) ) stream[i] = !stream[i]; //switching streams on / off
    
    var eff_x, eff_y, dir;
    dir = direction + (360 div effects) * i;
    eff_x = xp + lengthdir_x(dis, dir); //put effect x on a distance
    eff_y = yp + lengthdir_y(dis, dir); //put effect y on a distance
    
    geon_effect_stream(effect_fire[i], eff_x, eff_y, stream[i]); //updating effects position
}

