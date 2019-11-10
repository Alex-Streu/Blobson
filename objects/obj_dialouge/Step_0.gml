/// @description Insert description here
// You can write your code in this editor

interaction_button = gamepad_button_check_pressed(0,gp_face1);

if (interaction_button)
{
	if (page < array_length_1d(text) - 1) {page++;}
	else {instance_destroy();}
}

if page = 1  {audio_play_sound(sfx_fart1,10,false);}