//Setup players
player1 = ds_map_create();
player1[? "Name"] = "Player 1";
player1[? "Color"] = c_red;
player1[? "Active"] = true;

player2 = ds_map_create();
player2[? "Name"] = "Player 2";
player2[? "Color"] = c_blue;
player2[? "Active"] = true;

players = ds_map_create();
players[? "Player1"] = player1;
players[? "Player2"] = player2;


//-------------------------------------
//Setup characters

//SARINA
sarina = ds_map_create();
sarina[? "Name"] = "Sarina";
sarina[? "IsUnlocked"] = true;
sarina[? "Icon"] = spr_sarina_cs_icon;
sarina[? "Portrait"] = spr_sarina_cs_portrait;

//OTUS
otus = ds_map_create();
otus[? "Name"] = "Otus";
otus[? "IsUnlocked"] = true;
otus[? "Icon"] = spr_otus_icon;
otus[? "Portrait"] = spr_otus_portrait;

//DELETE ME
temp1 = ds_map_create();
temp1[? "Name"] = "Samus";
temp1[? "IsUnlocked"] = true;
temp1[? "Icon"] = spr_sarina_cs_icon;
temp1[? "Portrait"] = spr_sarina_cs_portrait;

temp2 = ds_map_create();
temp2[? "Name"] = "Mario";
temp2[? "IsUnlocked"] = true;
temp2[? "Icon"] = spr_sarina_cs_icon;
temp2[? "Portrait"] = spr_sarina_cs_portrait;

temp3 = ds_map_create();
temp3[? "Name"] = "Falcon";
temp3[? "IsUnlocked"] = true;
temp3[? "Icon"] = spr_sarina_cs_icon;
temp3[? "Portrait"] = spr_sarina_cs_portrait;

temp4 = ds_map_create();
temp4[? "Name"] = "Peach";
temp4[? "IsUnlocked"] = true;
temp4[? "Icon"] = spr_sarina_cs_icon;
temp4[? "Portrait"] = spr_sarina_cs_portrait;

temp5 = ds_map_create();
temp5[? "Name"] = "Pikachu";
temp5[? "IsUnlocked"] = true;
temp5[? "Icon"] = spr_sarina_cs_icon;
temp5[? "Portrait"] = spr_sarina_cs_portrait;

temp6 = ds_map_create();
temp6[? "Name"] = "Jiggly";
temp6[? "IsUnlocked"] = true;
temp6[? "Icon"] = spr_sarina_cs_icon;
temp6[? "Portrait"] = spr_sarina_cs_portrait;

temp7 = ds_map_create();
temp7[? "Name"] = "Luigi";
temp7[? "IsUnlocked"] = true;
temp7[? "Icon"] = spr_sarina_cs_icon;
temp7[? "Portrait"] = spr_sarina_cs_portrait;

temp8 = ds_map_create();
temp8[? "Name"] = "Ness";
temp8[? "IsUnlocked"] = true;
temp8[? "Icon"] = spr_sarina_cs_icon;
temp8[? "Portrait"] = spr_sarina_cs_portrait;

characters = [
	sarina,
	otus, 
	temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8
];