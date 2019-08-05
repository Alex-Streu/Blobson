stage_select_init();

rowSize = 4;

var _offsetY = 50;
var _offsetX = 50;
var _space = 10;

//Create icon objects
for (var i = 0; i < array_length_1d(stages); i++) {
	var _s = stages[i];
	if (!_s[? "IsUnlocked"]) { continue; }
	
	_space = 50 + sprite_get_width(_s[? "Icon"]);
	create_stage_select_item(_s[? "Name"], _s[? "Icon"], _s[? "Room"], _offsetX + _space*(i%rowSize), _offsetY + _space*floor(i/rowSize));
}


//--------------------------
//Setup cursor

create_cursor(cursors[0], 64, 64);