/// @description
//Create a map for the profiles
var _map = ds_map_create();
var _profile = ds_map_create();
Profile_Change(_profile,PROFILE.name,"Springroll Games");
Profile_Change(_profile,PROFILE.wins,100);
Profile_Change(_profile,PROFILE.games_played,41);
Profile_Change(_profile,PROFILE.custom_controls,[]);
Profile_Change(_profile,PROFILE.favorite_skins,0);
Profile_Change(_profile,PROFILE.color,c_lime);
ds_map_add_map(_map,"default",_profile);
save_string_file("default_profile.sav",json_encode(_map));
ds_map_destroy(_map);