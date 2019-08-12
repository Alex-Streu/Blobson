///@func create_magnetbox(rx,ry,xscale,yscale,damage,hitlag,goal_x,goal_y,magnet_time,lifetime,shape,hitbox_group);
///@param relative_x
///@param relative_y
///@param xscale
///@param yscale
///@param damage
///@param hitlag
///@param goal_x
///@param goal_y
///@param magnet_time
///@param lifetime
///@param shape
///@param hitbox_group
var _newhitbox = instance_create_layer(x+argument[0]*facing,y+argument[1],layer,obj_magnetbox);
with(_newhitbox)
	{
	image_xscale=argument[2];
	image_yscale=argument[3];
	damage=argument[4];
	base_hitlag=argument[5];
	magnet_goal_x=other.x+argument[6]*other.facing;
	magnet_goal_y=other.y+argument[7]
	magnet_frame=argument[8];
	lifetime=argument[9];
	set_hitbox_property(id,HITBOX_PROPERTY.shape,argument[10]);
	owner=other.id;
	owner_xstart=other.x;
	owner_ystart=other.y;
	hitbox_group=argument[11];
	}
ds_list_add(my_hitboxes,_newhitbox);
return _newhitbox;