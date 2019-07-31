///@func background_clear_activate(length,color)
///@param length
///@param color
///@desc Sets the background fade effect and the player fade effect
with(obj_background_manager)
	{
	background_clear_frame = argument[0];
	background_clear_amount=1;
	background_clear_color = argument[1];
	}
with(obj_player)
	{
	fade_value = 0;
	}