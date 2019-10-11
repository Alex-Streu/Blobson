/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_cubecrush_break,10,false)
obj_crushrush.cubes_destroyed += 1;
fx_create(spr_cubecrush_cubebreak,1,0,16,x,y,1,0)

with(obj_player)
{
//set_state(PLAYER_STATE.in_hitlag);
self_hitlag_frame= 9;
}

#region If cube is destroyed. Update crushrush object.
if red = true   {obj_crushrush.red_cube = false;}
if blue = true   {obj_crushrush.blue_cube = false;}
if yellow = true   {obj_crushrush.yellow_cube = false;}
if green = true   {obj_crushrush.green_cube = false;}
if purple = true   {obj_crushrush.purple_cube = false;}
if orange = true   {obj_crushrush.orange_cube = false;}
if cyan = true   {obj_crushrush.cyan_cube = false;}
if pink = true   {obj_crushrush.pink_cube = false;}
if white = true   {obj_crushrush.white_cube = false;}
#endregion

instance_destroy(self);

