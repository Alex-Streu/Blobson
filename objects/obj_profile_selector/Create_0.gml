/// @description Load profiles
enum DDSTATE {
	OPEN,
	CLOSED
}

profiles = [];
selected = noone;
clicked = false;
state = DDSTATE.CLOSED;
items = noone;
yPress = false;
selectedIndex = 0;
key = -1;