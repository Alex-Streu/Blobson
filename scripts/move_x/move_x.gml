///@func move_x()
//Loop 1 pixel at a time
if (hsp!=0)
	{
	repeat(abs(hsp))
		{
		//If there's no block, move
		if (!place_meeting(x+sign(hsp),y,obj_solid))
			{
			x+=sign(hsp);
			}
		else
			{
			hsp_frac=0;
			hsp=0;
			break;
			}
		}
	}