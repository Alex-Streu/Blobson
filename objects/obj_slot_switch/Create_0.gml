/// @description Initialize switch
event_inherited();

isHovered = false;

text = ds_list_create();
text[| SLOT_STATE.OFF] = "OFF";
text[| SLOT_STATE.PLAYER] = "HMN";
text[| SLOT_STATE.CPU] = "CPU";