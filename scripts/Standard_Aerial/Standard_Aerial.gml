///Standard_Aerial
//Contains the standard actions for the aerial state.
var run=true;
#region Animation

//Peak of jump
if (abs(vsp)<1)
	{
	if double_jumps = max_double_jumps { anim_sprite=my_sprites[?"Midair"];}
	if double_jumps < max_double_jumps  {	anim_sprite=my_sprites[?"Doublejumpair"];}
	anim_speed = ani_speed_airborne;
	}
//Falling
else if (vsp>=1)
	{
	anim_sprite=my_sprites[?"Fall"];
	}
//Rising - normal jump
else if (vsp<=1) 
	{
	anim_speed= ani_speed_jump;
	if double_jumps = max_double_jumps { anim_sprite=my_sprites[?"Jump"];}
	if double_jumps < max_double_jumps  {	anim_sprite=my_sprites[?"Doublejump"];}
	}
	
//Fastfalling
if (vsp>=fast_fall_speed)
	{
	anim_sprite=my_sprites[?"Fastfall"];
	}
#endregion
#region Friction and Gravity
friction_gravity(air_friction,grav,max_fall_speed);
#endregion
#region Landing
if check_landing() run=false;
#endregion
#region Ledge
if run && check_ledge_grab_falling() run=false;
#endregion
#region Airdodging
if run && check_airdodge() run=false;
#endregion
#region Horizontal Movement
if (run) aerial_drift();
#endregion
#region Fastfalling
if (run) fastfall_try();
#endregion
#region Double Jumping
//If you have enough jumps
if (run && double_jumps>0)
	{
	//If jump is being pressed
	if (button(INPUT.jump,buff))
		{
		double_jump();
		run=false;
		}
	}
#endregion
#region Buffered Aerial
if (run && jump_buffer_aerial)
	{
	check_aerials();
	jump_buffer_aerial=false;
	run=false;
	}
#endregion
#region Attacking
if run && check_aerials() run=false;
if run && check_smashes() run=false;
if run && check_specials() run=false;
#endregion
move_();