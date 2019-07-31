///@func on_plat(x,y);
///@param x
///@param y
var _x,_y;
_x=argument0;
_y=argument1;

//Direct collision checking - fast
if (platform_check_type==0)
	{	
	if (place_meeting(_x,_y+1,obj_platform) && !place_meeting(_x,_y,obj_platform) && vsp>=0)
		{
		return true;
		}
	}
else
//Multi-platform list collision checking - slow
if (platform_check_type==1)
	{
	var _num,_list,_plat;
	_list=global.col_list;
	_num=instance_place_list(_x,_y+1,obj_platform,_list,false);
	_plat=noone;
	//If there is at least 1 collision
	if (_num>0)
		{
		//Loop through all collisions
		for(var i=0;i<ds_list_size(_list);i++)
			{
			_plat=_list[| i];
			//If you above the platform
			if (bbox_bottom<_plat.y && vsp>=0)
				{
				ds_list_clear(_list);
				return true;
				}
			}
		}
	ds_list_clear(_list);
	}
return false;