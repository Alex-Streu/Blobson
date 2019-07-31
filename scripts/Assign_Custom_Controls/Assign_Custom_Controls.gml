///@func Assign_Custom_Controls()
//Loop through every Player object, load the saved controls
with(obj_player)
	{
	if (controller >= 0)
		{
		Custom_Controls_Load(cc,player_number);
		}
	else
		{
		Custom_Controls_Load(cc,0);
		is_AI = true;
		}
	}