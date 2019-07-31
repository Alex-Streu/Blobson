/// @description Insert description here
// You can write your code in this editor
current_pal=wrap(current_pal,0,pal_swap_get_pal_count(my_pal_sprite)-1);



if(keyboard_check_pressed(vk_up))
    current_pal++;
if(keyboard_check_pressed(vk_down))
    current_pal--;