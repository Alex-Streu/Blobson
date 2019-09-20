//Setup players
var player1 = ds_map_create();
player1[? "Name"] = "Player 1";
player1[? "Number"] = PLAYER.P1;
player1[? "Color"] = c_red;
player1[? "IsActive"] = gamepad_is_connected(global.device_number[PLAYER.P1]);
player1[? "Marker"] = [ spr_p1_marker, 25, 1 ];

var player2 = ds_map_create();
player2[? "Name"] = "Player 2";
player2[? "Number"] = PLAYER.P2;
player2[? "Color"] = c_blue;
player2[? "IsActive"] =gamepad_is_connected(global.device_number[PLAYER.P2]);
player2[? "Marker"] = [ spr_p2_marker, 75, 1 ];

var player3 = ds_map_create();
player3[? "Name"] = "Player 3";
player3[? "Number"] = PLAYER.P3;
player3[? "Color"] = c_yellow;
player3[? "IsActive"] = gamepad_is_connected(global.device_number[PLAYER.P3]);
player3[? "Marker"] = [ spr_p3_marker, 25, 98 ];

var player4 = ds_map_create();
player4[? "Name"] = "Player 4";
player4[? "Number"] = PLAYER.P4;
player4[? "Color"] = c_green;
player4[? "IsActive"] = gamepad_is_connected(global.device_number[PLAYER.P4]);
player4[? "Marker"] = [ spr_p4_marker, 75, 98 ];

players = [];
players[PLAYER.P1] = player1;
players[PLAYER.P2] = player2;
players[PLAYER.P3] = player3;
players[PLAYER.P4] = player4;


//------------------------------------
//Setup player cursors
cursors = [];
cursors[PLAYER.P1] = spr_p1_select;
cursors[PLAYER.P2] = spr_p2_select;
cursors[PLAYER.P3] = spr_p3_select;
cursors[PLAYER.P4] = spr_p4_select;


//-------------------------------------
//Setup characters

//MATSU
matsu = ds_map_create();
matsu[? "Name"] = "Matsu";
matsu[? "IsUnlocked"] = true;
matsu[? "Icon"] = spr_sarina_cs_icon;
matsu[? "Portrait"] = spr_sarina_cs_portrait;
matsu[? "Script"] = scr_matsu;

//Sarina
sarina = ds_map_create();
sarina[? "Name"] = "Sarina";
sarina[? "IsUnlocked"] = true;
sarina[? "Icon"] = spr_sarina_cs_icon;
sarina[? "Portrait"] = spr_sarina_cs_portrait;
sarina[? "Script"] = scr_sarina;

//takia
takia = ds_map_create();
takia[? "Name"] = "Takia";
takia[? "IsUnlocked"] = true;
takia[? "Icon"] = spr_sarina_cs_icon;
takia[? "Portrait"] = spr_sarina_cs_portrait;
takia[? "Script"] = scr_takia;

characters = [
	matsu,
	sarina,
	takia
];
