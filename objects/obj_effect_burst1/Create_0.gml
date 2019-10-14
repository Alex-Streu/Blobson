//Call this function to load Geon FX effect from file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you're OK with default Particle System
effect_explosion = geon_effect_add("geon_fx/effects/explosion.geon", -1);
effect_asteroid = geon_effect_add("geon_fx/effects/asteroid_burst.geon", -1);

effect_fire = geon_effect_add("geon_fx/effects/car_fire.geon", -1, [spr_car_fire_flash, -1, -1, -1, -1, spr_car_fire_dust])