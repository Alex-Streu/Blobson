///@func roll_move(edge_buffer,speed,direction)
///@param edge_buffer
///@param speed
///@param direction
//Moving, without falling off cliffs
//Calculating collisions
var edge_buffer,spd,dir;
//This variable controls how close to the edge the player can role
//You may want to set it relative to the sprite width
edge_buffer=argument0;
spd=argument1;
dir=argument2;
repeat(abs(floor(spd)))
	{
	//If you're not rolling into a block
	if (!place_meeting(x+sign(dir),y,obj_solid))
		{
		//If you are rolling onto a block (there's something under your feet)
		if (place_meeting(x+sign(dir)*edge_buffer,y+1,obj_block))
			{
			//Move
			x+=sign(dir);
			}
		else
			break;
		}
	else
		break;
	}