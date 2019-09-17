/// @description Initialize properties
enum SLOT_STATE {
	PLAYER,
	CPU,
	OFF,
	HOLDING
}

player = PLAYER.P1;
controller = -1;
name = "";
character = noone;
color = c_gray;
sprite = sprite_index;
isLoaded = false;
isSelected = false;
cursor = noone;
cursorSprite = noone;
marker = noone;
state = SLOT_STATE.OFF;

//Profile management
profile = noone;
config = noone;

//Draw properties
drawSurface = noone;

//Create menu
menuStack = ds_stack_create();
menu = noone;
update_slot_menu(obj_menu_slot_off);

//Button management
buttons = noone;
buttonNames = ds_map_create();
holdingButton = noone;
holdingComplete = true;

//Manager properties
manageData = noone;