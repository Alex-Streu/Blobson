/// @description <Run by obj_game>
background_clear_frame = max(--background_clear_frame, 0);
if (background_clear_frame == 0)
	{
	background_clear_amount = max(0, background_clear_amount - 0.1);
	}