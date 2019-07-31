///@func calculate_knockback(target_hp,damage,weight,scaling,base_knockback)
///@param target_hp
///@param damage
///@param weight
///@param scaling
///@param base_knockback
var p,d,w,s,b;
p = argument[0];
d = argument[1];
w = argument[2];
s = argument[3];
b = argument[4];

/* Target HP is the damage percent the target has after the attack hits*/
//Formula (from Smash Bros)
//return ((((((p/10)+((p*d)/20))*w*1.4)+18)*s)+b);
//Custom Formula 1
//return ((p/10)+(d/20)*w*s)+b;
//Custom Formula 2 (doesn't use damage)
//return ((p/10)*w*s)+b;
//Rivals of Aether Formula
return b+(p+d)*s*knockback_scaling_multiplier*w;