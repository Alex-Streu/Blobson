/// @description Insert description here
// You can write your code in this editor

//Music

audio_stop_sound(sfx_music_menu2);

if room = rm_Training
{
	audio_play_sound(sfx_music_training,10,true)
}

if room = rm_Dreamland
{
	audio_play_sound(sfx_music_blobson_theme,10,true)
}

if room = rm_Stadium
{
	audio_play_sound(sfx_music_blobson_theme,10,true)
}