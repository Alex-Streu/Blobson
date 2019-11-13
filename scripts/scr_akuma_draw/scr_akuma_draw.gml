#region Heavy attack flashing
if heavy_flash = true
if anim_frame = 0
{
if anim_sprite = my_sprites[?"Uheavy" ]  {draw_sprite_ext(spr_sarina_uheavy_charge,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_red,0.7)}
if anim_sprite = my_sprites[?"Dheavy" ]  {draw_sprite_ext(spr_sarina_dheavy_charge,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_red,0.7)}
if anim_sprite = my_sprites[?"Fheavy" ]  {draw_sprite_ext(spr_sarina_fheavy_charge,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_red,0.7)}
}
#endregion
#region Dodgeroll flash
if dodgeroll_flash = true
if anim_sprite = my_sprites[?"Rolling" ]
{draw_sprite_ext(dodgeroll_sprite,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_white,0.4)}
#endregion
#region Airdodge flash
if airdodge_flash = true 
if anim_sprite = my_sprites[?"Airdodge" ]
{draw_sprite_ext(airdodge_sprite,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_white,0.4)}
#endregion

#region Parry Flash
if parry_startup_flash = true
if anim_sprite = my_sprites[?"Parry" ]
{
	draw_sprite_ext(parrystart_flash_sprite,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_white,0.5)
}
#endregion

#region EX flash
if sarina_dspecial_ex_dive = true
if anim_sprite = spr_sarina_dspecial_dive
{draw_sprite_ext(spr_sarina_dspecial_dive_ex,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_yellow,0.5)}
#endregion
#region EX flash - uspecial ground
if sarina_uspecial_ground_ex = true
if anim_sprite = spr_sarina_uspecial_ground
{draw_sprite_ext(spr_sarina_uspecial_ground_ex,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_yellow,0.5)}
#endregion
#region If parrying, glow baby
   if anim_sprite = my_sprites[?"Parryland" ]  and parry_flash = true
   {	
	draw_sprite_ext(parry_flash_sprite,anim_frame,x,y,sprite_scale * facing,sprite_scale,0,c_aqua,0.5)
	}
#endregion