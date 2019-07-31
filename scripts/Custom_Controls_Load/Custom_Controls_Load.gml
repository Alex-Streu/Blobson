///@func Custom_Controls_Load(target_array,player_number)
///@param target_array
///@param player_number
var _load_map,_load_list,_load_newlist;
//Load the file
_load_map=load_string_file("CustomControls.sav");
_load_list=_load_map[? "CONTROLS"];
_load_newlist=_load_list[| 0];
//The player adds the list contents into their own array!
//Loop through the list starting from the specific point
for(var i=0;i<number_of_buttons;i++)
	{
	//Load values into the array (using an accessor)
	//Turns the string values into real numbers for use with enums later (button)
	argument0[@ i]=real(_load_newlist[| (i+((number_of_buttons)*argument1))]);
	}
//Destroy DS
ds_list_destroy(_load_newlist);
ds_list_destroy(_load_list);
ds_map_destroy(_load_map);