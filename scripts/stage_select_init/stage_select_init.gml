//Setup player cursors
cursors = [];
cursors[PLAYER.P1] = spr_p1_select;


//-------------------------------------
//Setup stages

//STADIUM
stadium = ds_map_create();
stadium[? "Name"] = "Stadium";
stadium[? "IsUnlocked"] = true;
stadium[? "Icon"] = spr_stage_icon_stadium;
stadium[? "Room"] = rm_Stadium;

//Arena
arena = ds_map_create();
arena[? "Name"] = "Arena";
arena[? "IsUnlocked"] = true;
arena[? "Icon"] = spr_stage_icon_arena;
arena[? "Room"] = rm_Dreamland;

//EIGHT
eight = ds_map_create();
eight[? "Name"] = "Training";
eight[? "IsUnlocked"] = true;
eight[? "Icon"] = spr_icon_rivals;
eight[? "Room"] = rm_Training;

//Casino
casino = ds_map_create();
casino[? "Name"] = "Casino";
casino[? "IsUnlocked"] = true;
casino[? "Icon"] = spr_stage_icon_arena;
casino[? "Room"] = rm_Casino;

//DRILLER
driller = ds_map_create();
driller[? "Name"] = "Driller";
driller[? "IsUnlocked"] = true;
driller[? "Icon"] = spr_icon_rivals;
driller[? "Room"] = rm_Driller;

stages = [
	stadium,
	arena,
	eight,
	casino,
	driller
];