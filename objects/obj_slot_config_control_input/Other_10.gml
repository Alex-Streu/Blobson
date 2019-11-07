/// @description Click event

// Inherit the parent event
event_inherited();

recording = true;

with (owner)
{
	state = SLOT_STATE.HOLDING;
	holdingButton = buttons[? "Start"];
	holdingComplete = false;
}