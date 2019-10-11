var number = 8;
var dis = 150;

for (var i = 0; i < number; i += 1) //cycling through effects
{
    var eff_x, eff_y;
    
    eff_x = 100 + i * dis;
    
    geon_effect_burst(effect_explosion, eff_x, 100);
    geon_effect_burst(effect_explosion, eff_x, room_height-100);
}

