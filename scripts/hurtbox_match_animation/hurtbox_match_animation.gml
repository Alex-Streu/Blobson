///@func hurtbox_match_animation()
///@desc Changes the hurtbox sprite to match the current animation. Useful for attacks.
hurtbox.sprite_index = anim_sprite;
hurtbox.image_index = anim_frame;
hurtbox.image_xscale = sprite_scale * facing;
hurtbox.image_yscale = sprite_scale;