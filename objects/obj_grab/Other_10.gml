/// @description <Run by obj_game>
//Nothing happens if the owner is somehow destroyed
if (instance_exists(owner))
	{
	//Sprite
	switch(shape)
		{
		case HITBOX_SHAPE.rectangle:
			sprite_index=spr_hitbox_rectangle;
			break;
		case HITBOX_SHAPE.circle:
			sprite_index=spr_hitbox_circle;
			break;
		}
	//Move with the player
	x=xstart+(owner.x-owner_xstart);
	y=ystart+(owner.y-owner_ystart);

	//Collisions
	
	//Check for sprite Collision
	var _num=instance_place_list(x,y,obj_hurtbox,list,false);
	if (_num>0)
		{
		//Loop through all hit players, an execute a script for each
		for(var i=0;i<_num;i++)
			{
			//Only grab 1 player
			if Grab_Collide(list[| i]) exit;
			}
		}
	//Clear the DS
	ds_list_clear(list);
	}
//Timer
lifetime=max(--lifetime,0);
if (lifetime==0)
	{
	instance_destroy();
	exit;
	}
//Destroy if the player was hit
if (owner.state!=PLAYER_STATE.attacking)
	{
	instance_destroy();
	exit;
	}