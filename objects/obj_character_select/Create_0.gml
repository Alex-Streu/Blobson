character_select_init();

navTimer = 0;

rowSize = 6;
rowSizes = ds_list_create();
csItems = ds_grid_create(rowSize, 5);

indexX = 0;
indexY = 0;

var _offsetY = y;
var _offsetX = 50;
var _space = 10;

//Create icon objects
for (var i = 0; i < array_length_1d(characters); i++) {
	var _c = characters[i];
	if (!_c[? "IsUnlocked"]) { continue; }
	
	_space = 50 + sprite_get_width(_c[? "Icon"]);
	var _item = create_character_select_item(_c[? "Name"], _c[? "Icon"], _c[? "Portrait"],
												_offsetX + _space*(i%rowSize), _offsetY + _space*floor(i/rowSize));
	csItems[# i%rowSize, i/rowSize] = _item;
	rowSizes[| floor(i/rowSize)] = i%rowSize;
}

//Select first icon
var _character = csItems[# indexX, indexY];
_character.selected = true;


//--------------------------
//Setup players

_offsetY = 32;
_offsetX = 50;
_space = 220;

//Create player slot objects
var _p = players[? "Player1"];
var _color = c_gray;
if (_p[? "Active"]) { _color = _p[? "Color"]; }
	
_p[? "Instance"] = create_character_select_player(_p[? "Name"], _color, _character.portrait,
											_offsetX, _offsetY);