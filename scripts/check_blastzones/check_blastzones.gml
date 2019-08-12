///@func check_blastzones(x1,y1,x2,y2)
///@param x1
///@param y1
///@param x2
///@param y2
//If you are outside the blastzone(colliding is okay, you must be completely outside)
if (rectangle_in_rectangle(x,y,x+sprite_width,y+sprite_height,argument0,argument1,argument2,argument3)==0)
	{
	//Exceptions for upper blastline
	//If in hitstun, you are KO'ed no matter what
	if (state == PLAYER_STATE.in_hitstun)
		{
		return true;
		}
	else
	//If not in hitstun, check if you are below the upper line before being KO'ed
	//If you above the upper line but not in hitstun, you are safe!
		{
		if (y > argument1)
			return true;
		}
	}
return false;