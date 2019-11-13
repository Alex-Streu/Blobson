/// @description Handle screen cleanup
var _start = false;
for(var i = 0; i < number_of_devices; i++)
{
	if (gamepad_button_check_pressed(i, gp_start)) _start = true;
	if (keyboard_check_pressed(vk_enter)) _start = true;
}
			
//Handle final checks
if (_start)
{
	var _ready = true;
	with (obj_character_select_slot)
	{
		if (state != SLOT_STATE.OFF)
		{
			if (!isSelected) { _ready = false; }
			else
			{
				pm_update_player(player, character.script);
			}
		}
	}
	if (_ready) { room_goto(rm_Stage_Select); }
}