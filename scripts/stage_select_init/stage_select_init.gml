//Setup player cursors
cursors = [];
cursors[PLAYER.P1] = spr_p1_select;


//-------------------------------------
//Setup stages

//TRAINING
training = ds_map_create();
training[? "Name"] = "Training Room";
training[? "IsUnlocked"] = true;
training[? "Icon"] = spr_icon_training;
training[? "Room"] = rm_Training;

//TRAINING
rivals = ds_map_create();
rivals[? "Name"] = "Rivals Arena";
rivals[? "IsUnlocked"] = true;
rivals[? "Icon"] = spr_icon_rivals;
rivals[? "Room"] = rm_Rivals;

//TRAINING
battlefield = ds_map_create();
battlefield[? "Name"] = "Battlefield";
battlefield[? "IsUnlocked"] = true;
battlefield[? "Icon"] = spr_icon_battlefield;
battlefield[? "Room"] = rm_Dreamland;

stages = [
	training,
	rivals,
	battlefield
];