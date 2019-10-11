/// @description
/*PROJECTILE VARIBLES*/
event_inherited();
visible=true;
//image_blend = projectile_draw_color;
damage=30;
base_knockback=5;
owner_xstart=0;
owner_ystart=0;
facing=1;
angle=-90;
hitbox_group= 1;
base_hitlag=10;
knockback_scaling=1;
angle_flipper=FLIPPER.standard;
di_angle=DI_Max;
grounded_angle=90;
drawing_angle=default_knockback_angle;
hsp=0;
vsp=0;
fric=0;
grav=0;
destroy_on_hit=false;
destroy=0;
collided=ds_list_create();
lifetime = 900;

attack = true;

overlay_sprite = spr_hitbox_rectangle;

impact_destroy = true;
//overlay_speed = 0.5;