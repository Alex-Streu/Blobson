/// @description
//Alarm for controller connection
alarm[0] = 1;
number_of_connections = 0;
button_array = [];

#region Buttom names (Nintendo)
/*
button_name[0]="B";
button_name[1]="A";
button_name[2]="Y";
button_name[3]="X";
button_name[4]="L";
button_name[5]="R";
button_name[6]="ZL";
button_name[7]="ZR";
button_name[8]="+";
button_name[9]="-";
button_name[10]="DPad";
button_name[11]="Rstick";
//*/
#endregion
#region Button names (Xbox)
//*
button_name[0] = "A";
button_name[1] = "B";
button_name[2] = "X";
button_name[3] = "Y";
button_name[4] = "LB";
button_name[5] = "RB";
button_name[6] = "LT";
button_name[7] = "RT";
button_name[8] = "Start";
button_name[9] = "Back";
button_name[10] = "DPad";
button_name[11] = "Rstick";
//*/
#endregion

//For each controller
for(var i = 0; i < max_players; i++)
	{
	//Set up cursor
	cursor[i] = 0;
	//Set up pressing button variables
	xPress[i] = false;
	yPress[i] = false;
	//Set up custom buttons array
	Custom_Controls_Reset(button_array, i);
	}
	
//Load custom controls if available
if (file_exists("CustomControls.sav"))
	{
	var _load_map, _load_list, _load_mylist;
	//Load the file
	_load_map = json_decode(load_string_file("CustomControls.sav"));
	_load_list = _load_map[? "CONTROLS"];
	//The player adds the list contents into their own array!
	for(var i = 0; i < max_players; i++)
		{
		_load_mylist = _load_list[| i];
		for(var m = 0; m < number_of_buttons; m++)
			{
			//Load values into the array
			button_array[@ m, i + 1] = real(_load_mylist[| m]);
			}
		}
	//Destroy DS
	ds_list_destroy(_load_mylist);
	ds_list_destroy(_load_list);
	ds_map_destroy(_load_map);
	}

//Voronoi
Voronoi_Change_Color([0.3, 0.5], [0.3, 0.5], [0.75, 1.0]);