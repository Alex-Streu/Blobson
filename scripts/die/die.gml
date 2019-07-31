///@func die()
///@desc Knocks out a player and destroys their hitboxes
audio_play_sound(choose(sfx_ko,sfx_fart1,sfx_fart2,sfx_fart3),10,false);
set_state(PLAYER_STATE.knocked_out);
destroy_all_attached_hitboxes(my_hitboxes);
camera_shake(death_cam_shake);
//Stock matches
stock--;
//Invulnerability
set_invulnerable(INV.type_invincible,ko_frame);