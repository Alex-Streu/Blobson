///@func calculate_hitstun(base_knockback,weight,damage,knockback_scaling,hitstun_multiplier)
///@param base_knockback
///@param weight
///@param damage
///@param knockback_scaling
///@param hitstun_multiplier
var b,w,d,s,m;
b = argument[0];
w = argument[1];
d = argument[2];
s = argument[3];
m = argument[4];
//Rivals of Aether Formula
//First: return b*4*((w-1)*0.6+1)+d*0.12*s*4*m*w;
//Current:
return ceil(b*hitstun_base_multiplier*((w-1)*hitstun_weight_multiplier+1)+d*hitstun_damage_multiplier*s*hitstun_knockback_multiplier*m*w);