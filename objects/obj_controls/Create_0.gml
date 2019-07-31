/// @description

//color select
pal_select = 1;


//Alarm for controller connection
alarm[0] = 1;
number_of_connections = 0;
button_array=[];
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
button_name[12]="Lstick";
//*/
#endregion
//Button names (Xbox)
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
button_name[12] = "Lstick";
//*/
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
	var _load_map,_load_list,_load_newlist;
	//Load the file
	_load_map = load_string_file("CustomControls.sav");
	_load_list = _load_map[? "CONTROLS"];
	_load_newlist = _load_list[| 0];
	//The player adds the list contents into their own array!
	//Loop through the list starting from the specific point
	for(var i = 0; i < number_of_buttons; i++)
		{
		for(var m = 0; m < max_players; m++)
			{
			//Load values into the array
			//Turns the string values into real numbers for use with enums later
			button_array[@ i, m + 1] = real(_load_newlist[| i + (number_of_buttons) * m]);
			}
		}
	//Destroy DS
	ds_list_destroy(_load_newlist);
	ds_list_destroy(_load_list);
	ds_map_destroy(_load_map);
	}

#region Voronoi
/*
length = 250;
uni_arx = shader_get_uniform(shd_voronoi,"point_x");
uni_ary = shader_get_uniform(shd_voronoi,"point_y");
uni_r = shader_get_uniform(shd_voronoi,"point_r");
uni_g = shader_get_uniform(shd_voronoi,"point_g");
uni_b = shader_get_uniform(shd_voronoi,"point_b");
uni_t = shader_get_uniform(shd_voronoi,"time");

point_x = [];
point_y = [];
point_hsp = [];
point_vsp = [];
point_r = [];
point_g = [];
point_b = [];

repeat(length)
	{
	point_x[array_length_1d(point_x)] = irandom_range(0,room_width);
	point_y[array_length_1d(point_y)] = irandom_range(0,room_height);
	point_hsp[array_length_1d(point_hsp)] = random_range(-0.5,0.5);
	point_vsp[array_length_1d(point_vsp)] = random_range(-0.5,0.5);
	point_r[array_length_1d(point_r)] = random_range(0.3,0.5);
	point_g[array_length_1d(point_g)] = random_range(0.3,0.5);
	point_b[array_length_1d(point_b)] = random_range(0.75,1.0);
	}
*/
#endregion

//Palette
current_pal = 1;
my_portrait_pal_sprite = spr_matsu_portrait_pal //fighter's portrait palette

///Override stuff.
override_surface=noone;
override_pal_index=1;