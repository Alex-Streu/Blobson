/// @description Click event

// Inherit the parent event
event_inherited();

with (owner)
{
	update_slot_menu();
				
	instance_destroy(cursor);
	cursor = noone;
				
	state = SLOT_STATE.OFF;
}