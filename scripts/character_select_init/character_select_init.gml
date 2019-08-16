//Setup players
var player1 = ds_map_create();
player1[? "Name"] = "Player 1";
player1[? "Number"] = PLAYER.P1;
player1[? "Color"] = c_red;
player1[? "IsActive"] = gamepad_is_connected(global.device_number[PLAYER.P1]);
player1[? "Marker"] = [ spr_p1_marker, 25, 1 ];
player1[? "SlotSprite"] = spr_p1_holder;

var player2 = ds_map_create();
player2[? "Name"] = "Player 2";
player2[? "Number"] = PLAYER.P2;
player2[? "Color"] = c_blue;
player2[? "IsActive"] = gamepad_is_connected(global.device_number[PLAYER.P2]);
player2[? "Marker"] = [ spr_p2_marker, 75, 1 ];
player2[? "SlotSprite"] = spr_p2_holder;

players = [];
players[PLAYER.P1] = player1;
players[PLAYER.P2] = player2;


//------------------------------------
//Setup player cursors
cursors = [];
cursors[PLAYER.P1] = spr_p1_select;
cursors[PLAYER.P2] = spr_p2_select;


//-------------------------------------
//Setup characters

//MATSU
matsu = ds_map_create();
matsu[? "Name"] = "Matsu";
matsu[? "IsUnlocked"] = true;
matsu[? "Icon"] = spr_sarina_cs_icon;
matsu[? "Portrait"] = spr_sarina_cs_portrait;
matsu[? "Script"] = scr_matsu;

//REWIND
rewind = ds_map_create();
rewind[? "Name"] = "Rewind";
rewind[? "IsUnlocked"] = true;
rewind[? "Icon"] = spr_otus_icon;
rewind[? "Portrait"] = spr_otus_portrait;
rewind[? "Script"] = scr_rewind;

characters = [
	matsu,
	rewind
];