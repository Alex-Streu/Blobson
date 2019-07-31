///@func grab_release_held()
///@desc Release the grabbed player with hitstun
set_state(PLAYER_STATE.in_hitstun);
set_speed(-facing * grab_release_hsp, grab_release_vsp, false, false);
hitstun_frame = grab_release_hitstun;
damage += grab_release_damage;