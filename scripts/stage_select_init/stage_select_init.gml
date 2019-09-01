//Setup player cursors
cursors = [];
cursors[PLAYER.P1] = spr_p1_select;


//-------------------------------------
//Setup stages

//STADIUM
stadium = ds_map_create();
stadium[? "Name"] = "Stadium";
stadium[? "IsUnlocked"] = true;
stadium[? "Icon"] = spr_icon_rivals;
stadium[? "Room"] = rm_Stadium;

//DREAMLAND
dreamland = ds_map_create();
dreamland[? "Name"] = "Dreamland";
dreamland[? "IsUnlocked"] = true;
dreamland[? "Icon"] = spr_icon_rivals;
dreamland[? "Room"] = rm_Dreamland;

//EIGHT
eight = ds_map_create();
eight[? "Name"] = "Training";
eight[? "IsUnlocked"] = true;
eight[? "Icon"] = spr_icon_rivals;
eight[? "Room"] = rm_Training;

//CENTERPIECE
centerpiece = ds_map_create();
centerpiece[? "Name"] = "Centerpiece";
centerpiece[? "IsUnlocked"] = true;
centerpiece[? "Icon"] = spr_icon_rivals;
centerpiece[? "Room"] = rm_Centerpiece;

//DRILLER
driller = ds_map_create();
driller[? "Name"] = "Driller";
driller[? "IsUnlocked"] = true;
driller[? "Icon"] = spr_icon_rivals;
driller[? "Room"] = rm_Driller;

stages = [
	stadium,
	dreamland,
	eight,
	centerpiece,
	driller
];