///@func Custom_Controls_Save(array_index)
///@param array_index
var _ar = argument[0];

//Make data structures that are temporary
var _save_list, _save_map;
_save_list = ds_list_create();
_save_map = ds_map_create();

//For each player
for(var i = 0; i < max_players; i++)
	{
	var _temp_list = ds_list_create();
	//Loop through the array and add contents to the list
	for(var m = 0; m < array_height_2d(_ar); m++)
		{
		//Add the custom controls to the list
		ds_list_add(_temp_list, string(_ar[@ m, (i + 1)]));
		}
	ds_list_add(_save_list, _temp_list);
	ds_list_mark_as_list(_save_list, ds_list_size(_save_list) - 1);
	}
	
//Add the list to the map, turn it into a string
ds_map_add_list(_save_map, "CONTROLS", _save_list);

//Save it in a file
save_string_file("CustomControls.sav", json_encode(_save_map));

//Destroy data structures
ds_list_destroy(_save_list);
ds_map_destroy(_save_map);