/// @description Click event
if (!doDraw) { return; }

// Inherit the parent event
event_inherited();

with (owner)
{
	update_slot_menu(obj_menu_slot_off);
				
	instance_destroy(cursor);
	cursor = noone;
				
	state = SLOT_STATE.OFF;
}