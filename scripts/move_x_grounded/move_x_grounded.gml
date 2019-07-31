///@func move_x_grounded(edge_buffer)
///@param edge_buffer
//Moving, without falling off cliffs
//Calculating collisions
var edge_buffer;
//This variable controls how close to the edge the player can role
//You may want to set it relative to the sprite width div 2
edge_buffer=argument[0];
repeat(abs(hsp))
	{
	//If you're not rolling into a block
	if (!place_meeting(x+sign(hsp),y,obj_solid))
		{
		//If you are rolling onto a block (there's something under your feet)
		if (place_meeting(x+sign(hsp)*edge_buffer,y+1,obj_block))
			{
			//Move
			x+=sign(hsp);
			}
		else
			{
			hsp=0;
			hsp_frac=0;
			break;
			}
		}
	else
		{
		hsp=0;
		hsp_frac=0;
		break;
		}
	}