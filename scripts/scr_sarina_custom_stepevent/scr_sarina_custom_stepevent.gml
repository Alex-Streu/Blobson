///The custom step script for SARINA. Make sure this can be checked in the obj_player object.

#region particle effectsd
                  if sarina_nspecial_effect = true		
				 {	 
				
				
				//NewEffect emitter positions. Streaming or Bursting Particles.
                 var nspecial3x, nspecial3y;
                 nspecial3x = x + 70;
                 nspecial3y = y - 66;
                 part_emitter_stream(nspecial_particles, global.pe_level_high, global.pt_level_high, 2);
                 part_emitter_region(nspecial_particles, global.pe_level_high, nspecial3x-83, nspecial3x-67, nspecial3y+20, nspecial3y+36, ps_shape_ellipse, ps_distr_linear);
	 
				 }

				 if sarina_nspecial_effect = false	   {part_emitter_destroy(nspecial_particles, global.pe_level_high); }	

#endregion

#region Crouch
//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"Crouch"  ]
if anim_frame >= 5.8    
{anim_frame = 6}
#endregion
#region Lag
if anim_sprite = my_sprites[?"Lag"]
if anim_frame >= 3
{
	anim_frame = 3;
}
#endregion
#region Wall jump
//If crouched, make the final frame not move.
if anim_sprite = my_sprites[?"WallJ"  ]
if anim_frame >= 3.8    
{anim_frame = 4}
#endregion
#region Flinch 
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
#endregion

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
            hurtbox.sprite_index = spr_sarina_jab3_hurtbox;
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
			#region utilt hurtbox
			if anim_sprite = spr_sarina_utilt
			{
            hurtbox.sprite_index = spr_sarina_utilt_hurtbox;
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
			#region Fheavy hurtbox
			if anim_sprite = spr_sarina_fheavy
			{
            hurtbox.sprite_index = spr_sarina_fheavy_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region Dheavy hurtbox
			if anim_sprite = spr_sarina_dheavy
			{
            hurtbox.sprite_index = spr_sarina_dheavy_hurtbox;
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
			#region dspecial slide hurtbox
			if anim_sprite = spr_sarina_dspecial_slide
			{
            hurtbox.sprite_index = spr_sarina_dspecial_slide_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region dspecial slide vault hurtbox
			if anim_sprite = spr_sarina_dspecial_vault
			{
            hurtbox.sprite_index = spr_sarina_dspecial_vault_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region dspecial dive hurtbox
			if anim_sprite = spr_sarina_dspecial_dive
			{
            hurtbox.sprite_index = spr_sarina_dspecial_dive_hurtbox;
            hurtbox.image_index = anim_frame;
            hurtbox.image_speed = 0;
            hurtbox.image_xscale = 1;
			if (facing == -1) {hurtbox.image_xscale *= -1;}	
            hurtbox.image_yscale = 1;
            hurtbox.image_angle = 0;
			}
			#endregion
			#region uspecial twist
			if anim_sprite = spr_sarina_uspecial_air
			{
            hurtbox.sprite_index = spr_sarina_uspecial_air_hurtbox;
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

#region If special move is not being performed, ensure ex version variables are turned off
if anim_sprite != my_sprites[?"Fspecial" ] {sarina_fspecial_ground_ex = false;}
if anim_sprite != my_sprites[?"Fspecial air" ] {sarina_fspecial_air_ex = false;}
if anim_sprite != my_sprites[?"Uspecial" ] {sarina_uspecial_ground_ex = false;}
if anim_sprite != my_sprites[?"Uspecial air2" ]  {sarina_uspecial_air_ex = false;}


#endregion

#region Parry flashing

if anim_sprite = my_sprites[?"Parryland" ]
{
   if (parry_frame =30)
   or (parry_frame =29)
   or (parry_frame =26)
   or (parry_frame =25)
   or (parry_frame =22)
   or (parry_frame =21)
   or (parry_frame =18)
   or (parry_frame =17)
   or (parry_frame =14)
   or (parry_frame =13)
   or (parry_frame =10)
   or (parry_frame =9)
   or (parry_frame =6)
   or (parry_frame =5)
   or (parry_frame =2)
   {
   parry_flash = true;
   }
   else
   {
	   parry_flash = false;
   }

}

#endregion

if invulnerable_frame > 0
if anim_sprite != spr_sarina_fspecial_ground
if anim_sprite != spr_sarina_fspecial_air
{
	image_alpha = 0.7;
}

if invulnerable_frame <= 0
if anim_sprite != spr_sarina_fspecial_ground
if anim_sprite != spr_sarina_fspecial_air
{
	image_alpha = 1;
}

if room = rm_Dreamland
{
image_blend = $FFD897B4 & $ffffff;
}

if parry_cooldown_timer > 0   {parry_cooldown_timer -= 1;}

//if (state != PLAYER_STATE.in_hitstun)
{
	
}

//if state = PLAYER_STATE.idle
///if (button(INPUT.shield, buff))
//{
//	set_state(PLAYER_STATE.parrying);
//	parry_frame = parry_startup;
//	run = false;
///}





if gamepad_button_check_pressed(controller,gp_stickl)
{
	current_pal--;
}

if gamepad_button_check_pressed(controller,gp_stickr)
{
	current_pal++;
}

if EX_meter > EX_meter_max   {EX_meter = EX_meter_max;}
if EX_meter < 100 {EX_level = 0;}
if EX_meter >= 100 and EX_meter < 200 {EX_level = 1;}
if EX_meter >= 200 and EX_meter < 300 {EX_level = 2;}
if EX_meter >= 300 {EX_level = 3;}
return;