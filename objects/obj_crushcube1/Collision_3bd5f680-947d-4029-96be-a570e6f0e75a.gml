/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_cubecrush_break,10,false)
obj_cubecrush.cubes_destroyed += 1;
fx_create(spr_cubecrush_cubebreak,1,0,16,x,y,1,0)

with(obj_player)
{
//set_state(PLAYER_STATE.in_hitlag);
self_hitlag_frame= 9;
}

instance_destroy(self);
