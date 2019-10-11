///The custom step script for SARINA. Make sure this can be checked in the obj_player object.



#region Crouch
//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"Crouch"  ]
if anim_frame >= 5.8    
{anim_frame = 6}
#endregion
#region Lag
if (lag_frame == 0)
if anim_sprite = my_sprites[?"Lag"]
if ani_lag_loop = false
{anim_frame = sprite_get_number(my_sprites[?"Lag"]) - 1;}
#endregion
#region Wall jump
//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"WallJ"  ]
if anim_frame >= 3.8    
{anim_frame = 4}
#endregion

if anim_sprite = my_sprites[?"Flinch1"]
if ani_lag_loop = false
if anim_frame >= 3.4    
{anim_frame = 4}

if anim_sprite = my_sprites[?"Flinch2"]
if ani_lag_loop = false
if anim_frame >= 3.4    
{anim_frame = 4}

if anim_sprite = my_sprites[?"Flinch3"]
if ani_lag_loop = false
if anim_frame >= 3.4    
{anim_frame = 4}

#region    If walking, make step sounds
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
#region    If running, make step sounds
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
#region    If in hutstun and frames reach all the way. pause at the end.
if anim_sprite = my_sprites[?"Hitstun" ]
if anim_frame >= 6
{
anim_speed = 0;
anim_frame = 7
}

#endregion

#region if doing certain movement or tech, update the hurtbox
 //hurtbox.sprite_index =spr_sarina_hurtbox;
#endregion
#region    If doing an attack, update the hurtbox
            
			#region jab 1 hurtbox
			if anim_sprite = spr_sarina_jab1
			{
            hurtbox.sprite_index = spr_sarina_jab_hurt;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region jab 2 hurtbox
			if anim_sprite = spr_sarina_jab2
			{
            hurtbox.sprite_index = spr_sarina_jab2_hurt;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region jab 3 hurtbox
			if anim_sprite = spr_sarina_jab3
			{
            hurtbox.sprite_index = spr_sarina_jab3_hurt;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region dtilt hurtbox
			if anim_sprite = spr_sarina_dtilt
			{
            hurtbox.sprite_index = spr_sarina_dtillt_hurt;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region ftilt hurtbox
			if anim_sprite = spr_sarina_ftilt
			{
            hurtbox.sprite_index = spr_sarina_ftilt_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region fair hurtbox
			if anim_sprite = spr_sarina_fair
			{
            hurtbox.sprite_index = spr_sarina_fair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region bair1 hurtbox
			if anim_sprite = spr_sarina_bair
			{
            hurtbox.sprite_index = spr_sarina_bair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region nair hurtbox
			if anim_sprite = spr_sarina_nair
			{
            hurtbox.sprite_index = spr_sarina_nair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			
			
#endregion

#region If doing a heavy sttack and charging it, flash the player.

//timer
if anim_sprite = my_sprites[?"Uheavy" ] or anim_sprite = my_sprites[?"Dheavy" ] or anim_sprite = my_sprites[?"Fheavy" ]
if anim_frame = 0
if heavy_flash_timer > 0
{
heavy_flash_timer -= 1;
}

if heavy_flash_timer <= 0   {heavy_flash_timer = heavy_flash_timer_startup;}

if heavy_flash_timer >= 5 and heavy_flash_timer <= 10   {heavy_flash = false;}
if heavy_flash_timer >= 0 and heavy_flash_timer < 5   {heavy_flash = true;}

#endregion


if ex_flash = true
if ex_flash_timer > 0
{
ex_flash_timer -= 1;
image_blend = c_yellow;
}

if ex_flash = true
if ex_flash_timer <= 0
{
	ex_flash = false;
	image_blend = c_white;
}


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