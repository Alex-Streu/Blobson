///@func profile_draw(profile_map,x,y,w,h)
///@param profile_map
///@param x
///@param y
///@param w
///@param h
///@desc Draws the profile with all of its information
var _map = argument[0],
	_x = argument[1],
	_y = argument[2],
	_width = argument[3],
	_height = argument[4],
	_radius = 20,
	_pad = 20;
	
var _name = _map[? "NAME"],
	_wins = _map[? "WINS"],
	_games = _map[? "GAME"],
	_cc = _map[? "CC"],
	_fav = _map[? "FAV"],
	_col = _map[? "COL"];
	
draw_roundrect_color_ext
	(
	_x,
	_y,
	_x + _width,
	_y + _height,
	_radius,_radius,
	_col,_col,
	false
	);
	
//Draw the profile information
draw_set_color(c_white);
draw_set_font(fnt_consolas);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(_x + _pad,_y + _pad*4,"Wins");
draw_text(_x + _pad,_y + _pad*7,"Games Played");
draw_text(_x + _pad,_y + _pad*10,"Win Rate");
draw_set_font(fnt_large);
draw_text(_x + _pad*3,_y + _pad*5,_wins);
draw_text(_x + _pad*3,_y + _pad*8,_games);
draw_text(_x + _pad*3,_y + _pad*11,string(100 * (_wins / _games)) + "%");
draw_set_halign(fa_center);
draw_text(_x + (_width div 2),_y + _pad,_name);