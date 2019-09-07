/// @description Change palette with up/down (Gradual)
/// @function Change palette with up/down 
/// @param Gradual
if(keyboard_check(vk_up))
    current_pal+=.05* delta_time * (60/1000000);
if(keyboard_check(vk_down))
    current_pal-=.05* delta_time * (60/1000000);

current_pal=clamp(current_pal,0,pal_swap_get_pal_count(my_pal_sprite)-1);

///Enable palette swapping.
if(!keyboard_check(vk_space))
    pal_swap_set_depth(my_pal_sprite,current_pal,1000000,999998,false);

