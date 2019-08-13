character_select_init();

rowSize = 6;

var _offsetY = y;
var _offsetX = 50;
var _space = 10;

//Create icon objects
for (var i = 0; i < array_length_1d(characters); i++) {
	var _c = characters[i];
	if (!_c[? "IsUnlocked"]) { continue; }
	
	_space = 50 + sprite_get_width(_c[? "Icon"]);
	create_character_select_item(_c[? "Name"], _c[? "Icon"], _c[? "Portrait"],
												_offsetX + _space*(i%rowSize), _offsetY + _space*floor(i/rowSize));
}


//--------------------------
//Setup players

_offsetY = 32;
_offsetX = 50;
_space = 220;

//Create player slot objects and selectors
for (var i = 0; i < array_length_1d(players); i++)
{
	var _p = players[i];
	
	var _slot = create_character_select_player(_p[? "Name"], _p[? "Color"], _p[? "IsActive"],
											_offsetX + _space*i, _offsetY, _p[? "Marker"]);
											
	if (_p[? "IsActive"]) { create_player_cursor(i, _slot, cursors[i]); }
}