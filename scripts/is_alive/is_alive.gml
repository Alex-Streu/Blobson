///@func is_alive(player_id)
///@param player_id
///Returns true if the player is not in the respawning or lost states
return (argument0.state!=PLAYER_STATE.lost && argument0.state!=PLAYER_STATE.respawning)