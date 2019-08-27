/// @description Insert description here
// You can write your code in this editor

if room = rm_Main_Menu or rm_Character_Select or rm_Character_Select2 or rm_Main_Menu2
if !audio_is_playing(sfx_music_menu2)
{
	audio_play_sound(sfx_music_menu2,10,true)
}
