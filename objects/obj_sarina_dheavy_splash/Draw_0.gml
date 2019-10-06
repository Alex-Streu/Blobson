/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	draw_sprite_ext(overlay_sprite,overlay_frame,x,y,1,1,image_angle,c_white,1);
	if (show_hitboxes)
		{
		//draw_self();
		draw_arrow
			(
			x,
			y,
			x+lengthdir_x(base_knockback*hitbox_draw_angle_multiplier,drawing_angle),
			y+lengthdir_y(base_knockback*hitbox_draw_angle_multiplier,drawing_angle),
			20
			);
		}
	if (game_surface_enable) surface_reset_target();
	}
//Outside view indicators
/*
var _cam_x = camera_get_view_x(obj_game.cam);
var _cam_y = camera_get_view_y(obj_game.cam);
var _cam_w = camera_get_view_width(obj_game.cam);
var _cam_h = camera_get_view_height(obj_game.cam);

if (!point_in_rectangle(x,y,_cam_x,_cam_y,_cam_x+_cam_w,_cam_y+_cam_h))
	{
	var _dir = point_direction(x,y,_cam_x+(_cam_w/2),_cam_y+(_cam_h/2));
	var _prec = 2;
	var _in_x = x;
	var _in_y = y;
	while(!point_in_rectangle(_in_x,_in_y,_cam_x,_cam_y,_cam_x+_cam_w,_cam_y+_cam_h))
		{
		_in_x += lengthdir_x(_prec,_dir);
		_in_y += lengthdir_y(_prec,_dir);
		}
	draw_circle_color(_in_x,_in_y,(600/point_distance(x,y,_cam_x+(_cam_w/2),_cam_y+(_cam_h/2)))*10,c_lime,c_lime,false);
	}
*/