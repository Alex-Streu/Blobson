///@func move_y_hit_platforms()
//Doesn't allow you to drop through platforms when falling
//Loop 1 pixel at a time
if (vsp!=0)
	{
	repeat(abs(vsp))
		{
		if (vsp<0)
			{
			//If there's no solid block, move
			if (!place_meeting(x,y+sign(vsp),obj_solid))
				{
				y+=sign(vsp);
				}		
			else
				{
				vsp_frac=0;
				vsp=0;
				break;
				}
			}
		else
		if (vsp>0)
			{
			if (on_ground())
				{
				vsp_frac=0;
				vsp=0;
				break;
				}
			else
				{
				y+=sign(vsp);
				}
			}
		}
	}