/// @description <Run by obj_game>
//Move
x+=hsp;
y+=vsp;
//Frame increase
fx_frame+=fx_speed*sprite_get_speed(fx_index)/(sprite_get_speed_type(fx_index)==spritespeed_framespergameframe ? 1 : room_speed);
if (fx_frame>sprite_get_number(fx_index))
	{
	fx_frame-=sprite_get_number(fx_index);
	}
//Following
if (instance_exists(follow))
	{
	x = follow.x;
	y = follow.y;
	fx_ang = point_direction(0,0,follow.hsp,follow.vsp);
	}
//Shrinking
if (shrink)
	{
	fx_xs *= shrink;
	fx_ys *= shrink;
	}
//Lifespan
if (--lifespan<0)
	{
	instance_destroy();
	}