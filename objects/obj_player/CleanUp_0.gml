/// @description
//Destory data structures to prevent memory leaks
ds_list_destroy(input_buffer);
ds_list_destroy(my_hitboxes);
ds_list_destroy(collided);
ds_list_destroy(state_log);
ds_map_destroy(my_attacks);
ds_map_destroy(my_sprites);
input_buffer=-1;
my_hitboxes=-1;
collided=-1;
state_log=-1;
my_attacks=-1;
my_sprites=-1;
cc=0;