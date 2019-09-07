/// @description Insert description here
// You can write your code in this editor

color_bg_hue = 0;
color_bg_sat = 255;
color_bg_val = 255;

if room = rm_Training
{
if !audio_is_playing(sfx_music_training)   {audio_play_sound(sfx_music_training,10,true)}
}

if room = rm_Rivals
{
if !audio_is_playing(sfx_music_arena1)   {audio_play_sound(sfx_music_arena1,10,true)}
}