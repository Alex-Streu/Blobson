//Draw if not off
if (state == SLOT_STATE.OFF) { return; }

draw_self();

//Draw marker
if (isSelected && character != noone)
{
	draw_sprite(marker[0], 0, character.x + marker[1], character.y + marker[2]);
}