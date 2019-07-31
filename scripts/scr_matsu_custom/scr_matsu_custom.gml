///The custom script for character0
return;

if anim_frame >= 6    {anim_frame = 7}

if gamepad_button_check_pressed(_num,gp_stickr)
{
	current_pal += 1
}

if EX_meter > EX_meter_max   {EX_meter = EX_meter_max;}