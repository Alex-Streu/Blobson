/// @description Load profiles
enum DDSTATE {
	OPEN,
	CLOSED
}

profiles = [];
isActive = false;
selected = noone;
clicked = false;
state = DDSTATE.CLOSED;
items = noone;
yPress = false;
selectedIndex = 0;