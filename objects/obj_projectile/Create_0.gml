/// @description
event_inherited();
/*PROJECTILE VARIBLES*/
visible=true;
image_blend=projectile_draw_color;
damage=10;
base_knockback=10;
owner_xstart=0;
owner_ystart=0;
facing=1;
angle=default_knockback_angle;
hitbox_group=-1;
base_hitlag=5;
knockback_scaling=1;
angle_flipper=FLIPPER.standard;
di_angle=DI_Max;
grounded_angle=90;
drawing_angle=default_knockback_angle;
hsp=0;
vsp=0;
fric=0;
grav=0;
destroy_on_hit=true;
destroy=0;
collided=ds_list_create();