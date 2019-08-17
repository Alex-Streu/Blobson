/// @description Initialize properties
enum SLOT_STATE {
	CURSOR,
	MENU
}

player = PLAYER.P1;
name = "";
character = noone;
color = c_gray;
sprite = sprite_index;
inactiveSprite = spr_pEmpty_holder;
isActive = false;
isSelected = false;
marker = noone;
cursor = noone;
profile = noone;
profiles = noone;
state = SLOT_STATE.CURSOR;


//Draw properties
drawSurface = noone;