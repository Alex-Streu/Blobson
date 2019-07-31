///@func Custom_Controls_Save(array_index)
///@param array_index
var ar=argument[0];
//Make data structures that are temporary
var save_list,save_map,save_newlist;
save_list=ds_list_create();
save_map=ds_map_create();
save_newlist=ds_list_create();
//Add the list to the other list (in case more data is added later)
ds_list_add(save_list,save_newlist);
ds_list_mark_as_list(save_list,ds_list_size(save_list)-1);
//For each player
for(var i=0;i<max_players;i++)
	{
	//Loop through the array and add contents to the list
	for(var m=0;m<array_height_2d(ar);m++)
		{
		//Add the custom controls to the list
		ds_list_add(save_newlist,string(ar[@ m,(i+1)]));
		}
	}
//Add the list to the map, turn it into a string
ds_map_add_list(save_map,"CONTROLS",save_list);
//Save it in a file
save_string_file("CustomControls.sav",json_encode(save_map));
//Destroy data structures
ds_list_destroy(save_newlist);
ds_list_destroy(save_list);
ds_map_destroy(save_map);