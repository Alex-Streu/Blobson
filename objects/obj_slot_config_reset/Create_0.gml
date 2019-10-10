/// @description Initialize switch
event_inherited();

text = ds_list_create();
text[| false] = "OFF";
text[| true] = "ON";