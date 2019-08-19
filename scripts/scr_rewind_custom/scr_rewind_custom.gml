///The custom script for character0
return;



if (on_ground())    {rewind_teleport_ready = true;}


if anim_sprite = spr_rewind_run
if anim_frame >= 1.90
{
	anim_frame = 2;
}

if anim_sprite = spr_rewind_crouch
if anim_frame >= 2
{
	anim_speed = 0;
	anim_frame = 2;
}

if anim_sprite = spr_rewind_entrance
if anim_frame >= 6
{
audio_play_sound(sfx_rewind_teleport,10,false)
}


//if anim_frame >= 6    {anim_frame = 7}

if gamepad_button_check_pressed(_num,gp_stickr)
{
	current_pal++;
}

if EX_meter > EX_meter_max   {EX_meter = EX_meter_max;}