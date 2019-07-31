///@func create_grab(rx,ry,xscale,yscale,xhold,yholdlifetime,shape);
///@param relative_x
///@param relative_y
///@param xscale
///@param yscale
///@param xhold
///@param yhold
///@param lifetime
///@param shape
var _newhitbox = instance_create_layer(x+argument[0]*facing,y+argument[1],layer,obj_grab);
with(_newhitbox)
	{
	image_xscale=argument[2];
	image_yscale=argument[3];
	grab_destination_x=argument[4]*other.facing;
	grab_destination_y=argument[5];
	lifetime=argument[6];
	set_hitbox_property(id,HITBOX.shape,argument[7]);
	owner=other.id;
	owner_xstart=other.x;
	owner_ystart=other.y;
	}
ds_list_add(my_hitboxes,_newhitbox);
return _newhitbox;