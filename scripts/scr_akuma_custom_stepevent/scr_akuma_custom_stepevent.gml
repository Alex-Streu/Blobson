///The custom script for Akuma

//To ensure this is on, go into obj_player in the step event


if akuma_fspecial_cooldown > 0   {akuma_fspecial_cooldown -= 1;}
if akuma_fspecial_cooldown < 0  {akuma_fspecial_cooldown = 0;}


//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"Crouch"  ]
if anim_frame >= 3.2  
{anim_frame = 4}







if (lag_frame == 0)
if anim_sprite = my_sprites[?"Lag"]
if ani_lag_loop = false
{anim_frame = sprite_get_number(my_sprites[?"Lag"]) - 1;}

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


#region    If running, make step sounds
if anim_sprite = my_sprites[?"Run"     ]
{
	
	if anim_frame > 1 and anim_frame < 3
	if !audio_is_playing(snd_step3)
	{
		audio_play_sound(snd_step3,7,false)
	}
	
	if anim_frame > 4 and anim_frame < 6
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
			#region forward tilt hurtbox
			if anim_sprite = spr_takia_ftilt
			{
            hurtbox.sprite_index = spr_takia_ftilt_hurt;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region down tilt hurtbox
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
			#region up heavy hurtbox
			if anim_sprite = spr_takia_uheavy
			{
            hurtbox.sprite_index = spr_takia_uheavy_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region back air
			if anim_sprite = spr_takia_bair
			{
            hurtbox.sprite_index = spr_takia_bair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region netural air
			if anim_sprite = spr_takia_nair
			{
            hurtbox.sprite_index = spr_takia_nair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region forward air
			if anim_sprite = spr_takia_fair
			{
            hurtbox.sprite_index = spr_takia_fair_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			
			
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