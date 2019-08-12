//Neutral Special - Draw
//Charging up
if (attack_phase == 1)
	{
	var _scale = 0.5 + (nspec_charge_shot_charge / 180) * 1.5;
	draw_sprite_ext
		(
		spr_nspec_charge_shot_projectile, 
		obj_game.current_frame div 3, 
		x + (32 * facing), 
		y, 
		_scale, 
		_scale, 
		0, 
		c_white, 
		1
		);
	}