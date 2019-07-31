///@func draw_surface_safe(id,x,y);
///@desc Checks if the surface exists before drawing.
///@param id
///@param x
///@param y
var surface,xx,yy;
surface=argument0;
xx=argument1;
yy=argument2;

//Check if the surface exists
if (surface_exists(surface))
	{
	draw_surface(surface,xx,yy);
	}