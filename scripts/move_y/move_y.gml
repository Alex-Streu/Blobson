///@func move_y()
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
			//If you aren't holding down or if you are wavelanding or airdodging, you don't go through platforms
			if (!stick_tilted(Lstick,DIR.down) || (state==PLAYER_STATE.wavelanding || state==PLAYER_STATE.airdodging))
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
			else
				{
				if (!on_solid(x,y))
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
			}
		}
	}