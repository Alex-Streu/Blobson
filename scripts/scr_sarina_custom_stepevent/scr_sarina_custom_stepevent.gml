///The custom script for SARINA


//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"Crouch"  ]
if anim_frame >= 5.8    
{anim_frame = 6}


if (lag_frame == 0)
if anim_sprite = my_sprites[?"Lag"]
if ani_lag_loop = false
{anim_frame = sprite_get_number(my_sprites[?"Lag"]) - 1;
}

#region If walking, make step sounds
if anim_sprite = my_sprites[?"Walk"    ]
{
	
	if anim_frame > 0 and anim_frame < 2
	if !audio_is_playing(snd_step1)
	{
		audio_play_sound(snd_step1,7,false)
	}
	
	if anim_frame = 6
	if !audio_is_playing(snd_step2)
	{
		audio_play_sound(snd_step2,7,false)
	}
	
	
	
}

#endregion
#region If running, make step sounds
if anim_sprite = my_sprites[?"Run"     ]
{
	
	if anim_frame > 2 and anim_frame < 4
	if !audio_is_playing(snd_step3)
	{
		audio_play_sound(snd_step3,7,false)
	}
	
	if anim_frame > 6 and anim_frame < 7.9
	if !audio_is_playing(snd_step4)
	{
		audio_play_sound(snd_step4,7,false)
	}
	
	
	
}

#endregion
#region if in hutstun and frames reach all the way. pause at the end.
if anim_sprite = my_sprites[?"Hitstun" ]
if anim_frame >= 6
{
anim_speed = 0;
anim_frame = 7
}

#endregion

//if (state != PLAYER_STATE.in_hitstun)
{
	
}




if gamepad_button_check_pressed(controller,gp_stickl)
{
	current_pal--;
}

if gamepad_button_check_pressed(controller,gp_stickr)
{
	current_pal++;
}

if EX_meter > EX_meter_max   {EX_meter = EX_meter_max;}
return;