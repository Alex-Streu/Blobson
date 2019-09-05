/// @description Initialize properties
enum SLOT_STATE {
	CURSOR,
	MENU,
	PLAYER,
	CPU,
	OFF
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
profiles = noone;
profile = noone;
config = noone;


//Draw properties
drawSurface = noone;

//Create slot switch
mySwitch = instance_create_layer(x + sprite_width - sprite_get_width(object_get_sprite(obj_slot_switch)) - 10, y + sprite_height - sprite_get_height(object_get_sprite(obj_slot_switch)) - 10, "MenuLayer", obj_slot_switch);
mySwitch.owner = id

//Create menu
menuStack = ds_stack_create();
menu = noone;
update_slot_menu(obj_menu_slot_off);