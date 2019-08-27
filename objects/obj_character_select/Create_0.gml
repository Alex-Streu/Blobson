//Create player manager
if (!instance_exists(obj_player_manager)) { instance_create_layer(0, 0, "GameLayer", obj_player_manager); }

//Setup characters
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
	create_character_select_item(_c[? "Name"], _c[? "Script"], _c[? "Icon"], _c[? "Portrait"],
												_offsetX + _space*(i%rowSize), _offsetY + _space*floor(i/rowSize));
}

//---------------------------
//Setup profiles
profiles = file_exists("PlayerProfiles.sav") ? json_decode(load_string_file("PlayerProfiles.sav")) : ds_list_create();



//--------------------------
//Setup players

_offsetY = 32;
_offsetX = 50;
_space = 220;

//Create player slot objects and menus
for (var i = 0; i < array_length_1d(players); i++)
{
	var _p = players[i];
	
	var _slot = create_character_select_player(_p[? "Number"], _p[? "Name"], _p[? "Color"], 
												_p[? "IsActive"], _p[? "Marker"], _p[? "SlotSprite"]);
											
	//Create menu
	var _menu = instance_create_layer(0, 0, "MenuLayer", obj_menu);
	with (_menu)
	{		
		owner = _slot;
	}
	
	//Setup active
	if (_p[? "IsActive"]) 
	{ 
		var _cursor = create_player_cursor(_slot, cursors[i]); 
		_slot.cursor = _cursor;
		
		_menu.pageIndex = 0;
	}
	
	pm_add_player(_p);
}