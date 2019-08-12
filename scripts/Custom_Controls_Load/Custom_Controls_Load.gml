///@func Custom_Controls_Load(target_array,player_number)
///@param target_array
///@param player_number
var _target = argument[0],
	_player = argument[1];
var _load_map, _load_list, _load_mylist;

//Load the file
_load_map = json_decode(load_string_file("CustomControls.sav"));
_load_list = _load_map[? "CONTROLS"];
_load_mylist = _load_list[| _player];

//The player adds the list contents into their own array!
for(var i = 0; i < number_of_buttons; i++)
	{
	_target[@ i] = real(_load_mylist[| i]);
	}
	
//Destroy DS
ds_list_destroy(_load_mylist);
ds_list_destroy(_load_list);
ds_map_destroy(_load_map);