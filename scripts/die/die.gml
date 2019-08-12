///@func die()
///@desc Knocks out a player and destroys their hitboxes
attack_stop();
set_state(PLAYER_STATE.knocked_out);
destroy_all_attached_hitboxes(my_hitboxes);
camera_shake(death_cam_shake);
hit_sfx_play(snd_hit_explosion);
//Stock matches
stock--;
//Invulnerability
set_invulnerable(INV.invincible, ko_frame);