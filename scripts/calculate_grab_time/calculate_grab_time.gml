///@func calculate_grab_time(target_hp)
///@param target_hp
var _hp = argument[0];
return base_grab_time + (_hp * grab_time_multiplier);