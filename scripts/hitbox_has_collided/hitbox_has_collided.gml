///@func hitbox_has_collided(id)
///@desc Checks if the given hitbox has hit something yet or not
///@param id
//Find the hitbox
if (instance_exists(argument[0]))
	{
	return argument[0].has_hit;
	}
return false;