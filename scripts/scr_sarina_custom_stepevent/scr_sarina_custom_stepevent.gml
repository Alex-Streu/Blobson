///The custom script for SARINA


//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"Crouch"  ]
if anim_frame >= 5.8    
{anim_frame = 6}

if anim_sprite = my_sprites[?"Lag"  ]
if anim_frame >= 3    
{anim_frame = 4}


if gamepad_button_check_pressed(controller,gp_stickr)
{
	current_pal++;
}

if EX_meter > EX_meter_max   {EX_meter = EX_meter_max;}
return;