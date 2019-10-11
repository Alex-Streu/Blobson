//When you add a lot of effects with the same filename, only the first one is actually read from the file. Others get particle types from the first effect and create own emitters. 
//You should manually remove duplicate effects when you done working with them.
for (var i = 0; i < 8; i += 1)
{
    effect_fire[i] = geon_effect_add("geon_fx/effects/fire.geon", -1);
    stream[i] = 1;
}

