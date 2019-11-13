
#region Ex meter
if !instance_exists(obj_crushrush){EX_meter = 100;}
if instance_exists(obj_crushrush) {EX_meter = 300;}
EX_meter_max = 300;
EX_level = 1;

//Attack/move ex meter usage
ex_useage_ftilt = 100;

ex_useage_fspecial_ground = 100;
ex_useage_fspecial_air = 100;
ex_useage_dspecial_air = 100;
ex_useage_dspecial_slide = 100;
ex_useage_uspecial_ground = 100;
ex_useage_uspecial_air= 100;
#endregion
#region Animations - Attacks
my_sprites[?"Dashattack" ]=spr_sarina_dashattack
my_sprites[?"Grab" ]=spr_sarina_grab;
my_sprites[?"Grabbing" ]=spr_sarina_grab_idle;
my_sprites[?"Bthrow" ]=spr_sarina_bthrow;
my_sprites[?"Fthrow" ]=spr_sarina_fthrow;
my_sprites[?"Uthrow" ]=spr_sarina_uthrow;
my_sprites[?"Dthrow" ]=spr_sarina_dthrow;
my_sprites[?"Pummel"] = spr_sarina_pummel;
my_sprites[?"Jab1" ]=spr_sarina_jab1;
my_sprites[?"Jab2" ]=spr_sarina_jab2;
my_sprites[?"Jab3" ]=spr_sarina_jab3;
my_sprites[?"Ftilt" ]=spr_sarina_ftilt;
my_sprites[?"Ftilt_ex" ]=spr_sarina_ftilt_ex;
my_sprites[?"Dtilt" ]=spr_sarina_dtilt;
my_sprites[?"Utilt" ]=spr_sarina_utilt;
my_sprites[?"Nair" ]=spr_sarina_nair;
my_sprites[?"Bair" ]=spr_sarina_bair;
my_sprites[?"Bairb"]=spr_sarina_bair2;
my_sprites[?"Fair" ]=spr_sarina_fair;
my_sprites[?"Dair" ]=spr_sarina_dairv2;
my_sprites[?"Uair" ]=spr_sarina_uair;
my_sprites[?"Fheavy" ]=spr_sarina_fheavy;
my_sprites[?"Dheavy" ]=spr_sarina_dheavy;
my_sprites[?"Uheavy" ]=spr_sarina_uheavy;
my_sprites[?"Nspecial" ]=spr_sarina_nspecial;
my_sprites[?"Fspecial" ]=spr_sarina_fspecial_ground;
my_sprites[?"Fspecial air" ]=spr_sarina_fspecial_air;
my_sprites[?"Uspecial" ]=spr_sarina_uspecial_ground;
my_sprites[?"Uspecial air" ]=spr_sarina_uspecial_airv3;
my_sprites[?"Uspecial air2" ]=spr_sarina_uspecial_airv2;
#endregion
//Sound effects____________________________________________________________________________________
#region Sounds for everything besides attacks
snd_dash = sfx_dash1;
snd_step1 = sfx_step1;
snd_step2 = sfx_step1;
snd_step3 = sfx_step3;
snd_step4 = sfx_step4;
#endregion
#region Sounds for attacks and effects
snd_grab = sfx_matsu_jab3;
snd_pummel = sfx_hit_light7;
snd_parrystart = sfx_parrystart;


snd_jab1 = sfx_matsu_jab1;
snd_jab1_hit = sfx_hit_light1;
snd_jab2 = sfx_matsu_jab2;
snd_jab2_hit = sfx_hit_light2;
snd_jab3 = sfx_matsu_jab3;
snd_jab3_hit = sfx_stab1; // med 2
snd_dashattack_hit = sfx_stab3;

snd_nair = sfx_swoosh2;
snd_nair_sourhit = sfx_hit_light1;
snd_nair_hit = sfx_hit_light5; // light5 

snd_bair_b = sfx_swoosh2;
snd_bair_b_hit= sfx_hit_med11; // light5 

snd_fair_hit = sfx_stab3;
snd_fair = sfx_swoosh2;

snd_bair1 = sfx_swoosh2;
snd_bair1_hit = sfx_stab3; // med2
snd_bair1_sweethit = sfx_stab1; // light5 


snd_bair_hit = sfx_hit_med11; // med2

snd_dair = sfx_swoosh2;
snd_dair_hit = sfx_stab3; // light5 
snd_dair_sweetspot_hit = sfx_stab4; // light5 

snd_uair_hit = sfx_stab2; // light5 
snd_uair_sourhit = sfx_stab3; // light5 
snd_uair_sweethit = sfx_stab1;; // light5 

snd_ftilt_normal_sourhit = sfx_stab3;
snd_ftilt_normal_tipper = sfx_stab1;

snd_ftilt_firsthit = sfx_stab1;
snd_ftilt_hit = sfx_stab2; // light5 
snd_ftilt_endhit = sfx_stab4;
snd_ftilt_loop = sfx_swoosh2;

snd_dtilt_hit = sfx_hit_light4; // light5 
snd_dtilt_sweethit = sfx_hit_med1

snd_utilt_hit = sfx_stab3; // light5 

snd_fheavy_hit = sfx_stab1; // light5 
snd_fheavy_sourhit = sfx_stab3; // light5 
snd_fheavy_sweethit = sfx_stab4; // light5 

snd_uheavy = sfx_swoosh2; // light5 
snd_uheavy_hit = sfx_stab3;// light5 

snd_dheavy_hit = sfx_hit_heavy2; // light5 

snd_fspecial1 = sfx_swish_strong1//Sarina when she lounges
snd_fspecial2 = sfx_swoosh1//Sarina when she swings
snd_fspecial_hit = sfx_stab1//Sarina when she lands the attack
snd_fspecial_ex_hit = sfx_stab4//Sarina when she lands the EX attack

snd_dspecial_vault_hit = sfx_hit_med8;
snd_dspecial_vault_sourhit = sfx_hit_light1;
snd_dspecial_slide_hit = sfx_hit_light2;
snd_dspecial_dive_hit = sfx_hit_med2;
snd_dspecial_dive_exhit = sfx_hit_heavy3;

snd_uspecial_hit = sfx_hit_heavy4;
snd_uspecial_ex_hit = sfx_stab4;

snd_uthrow_hit = sfx_hit_light2;
snd_uthrow_sourhit = sfx_hit_light1;

snd_fthrow1 = sfx_swish_strong1;
snd_fthrow2 = sfx_swoosh1;
snd_fthrow_hit = sfx_hit_heavy4;

snd_bthrow1 = sfx_swish_strong1;
snd_bthrow2 = sfx_swoosh1;
snd_bthrow_hit1 = sfx_stab3;
snd_bthrow_hit2 = sfx_stab4;

snd_dthrow_hit = sfx_hit_1;

snd_hitmulti1 = sfx_hit_light1;
snd_hitmulti2 = sfx_hit_light2;

snd_tipper1 = sfx_stab4;
snd_tipper2 = sfx_stab1;
#endregion
//Voices___________________________________________________________________________________________
#region Voice clips
vc_nothing = sfx_nothing;
vc_intro1a = sfx_nothing;
vc_intro1b = sfx_nothing;
vc_intro2a = sfx_nothing;
vc_intro2b = sfx_nothing;

vc_parry = sfx_vc_sarina_attack10;

#region Voice attacks - general

vc_jab1 = sfx_nothing;
vc_jab2 = sfx_nothing;
vc_jab3 = sfx_vc_sarina_attack9;
vc_dashattack1 = sfx_nothing;
vc_dashattack2 = sfx_nothing;

//Tilt attacks
vc_ftilt = sfx_vc_sarina_attack_ftilt1;

vc_ftilt_ex = sfx_vc_sarina_attack_ftilt3;
vc_dtilt1 = sfx_vc_sarina_action2;
vc_dtilt2 = sfx_nothing;
vc_utilt1 = sfx_nothing;
vc_utilt2 = sfx_nothing;

//air attacks
vc_uair1 = sfx_nothing;
vc_uair2 = sfx_nothing;
vc_dair1 = sfx_nothing;
vc_dair2 = sfx_nothing;
vc_fair1 = sfx_vc_takia_action1;
vc_fair2 = sfx_vc_takia_action2;
vc_bair1 = sfx_nothing;
vc_bair2 = sfx_nothing;
vc_nair1 = sfx_vc_takia_action1;
vc_nair2 = sfx_vc_takia_action1;

//heavy attacks
vc_fheavy1 = sfx_vc_sarina_attack9;
vc_fheavy2 = sfx_vc_sarina_attack2;
vc_dheavy1 = sfx_vc_sarina_attack9;
vc_dheavy2 = sfx_vc_sarina_attack2;
vc_uheavy1 = sfx_vc_sarina_attack9;
vc_uheavy2 = sfx_vc_sarina_attack2;

//special attacks
vc_nspecial1 = sfx_nothing;
vc_nspecial2 = sfx_nothing;
vc_fspecial1 = sfx_vc_sarina_action1;
vc_fspecial2 = sfx_vc_sarina_fspecial;
vc_uspecial1 = sfx_vc_sarina_uspecial1;
vc_uspecial2 = sfx_vc_sarina_uspecial2;
vc_uspecial_ex1 = sfx_vc_sarina_uspecial_ex1;//"How about-"
vc_uspecial_ex2 = sfx_vc_sarina_uspecial_ex2;//"THIS?"
vc_dspecial1 = sfx_nothing;
vc_dspecial2 = sfx_nothing;
//grabs/throws
vc_grabmiss1 = sfx_vc_sarina_grabmiss;
vc_grabmiss2 = sfx_vc_sarina_grabmiss2;
vc_uthrow = sfx_vc_sarina_attack1;
vc_bthrow = sfx_vc_sarina_bthrow;
vc_dthrow = sfx_vc_sarina_attack7;
vc_fthrow = sfx_vc_sarina_action5;
#endregion
#region Voice actions - general
vc_jump1 = sfx_vc_sarina_action1;
vc_jump2 = sfx_vc_sarina_action1;
vc_doublejump1 = sfx_nothing;
vc_doublejump2 = sfx_nothing;
vc_walljump1 = sfx_nothing;
vc_walljump2 = sfx_nothing;
vc_parry1 = sfx_nothing;
vc_parry2 = sfx_nothing;
vc_parryland1 = sfx_nothing;
vc_parryland2 = sfx_nothing;
vc_ledgesnap1 = sfx_nothing;
vc_ledgesnap2 = sfx_nothing;
vc_dodgeroll1 = sfx_nothing;
vc_dodgeroll2 = sfx_nothing;
vc_airdodge1 = sfx_nothing;
vc_airdodge2 = sfx_nothing;
#endregion
#region Voice hurt - general
vc_hurt_light1 = sfx_vc_sarina_hit1; //if damage is under 50%
vc_hurt_light2 = sfx_vc_sarina_hit5; //if damage is under 50%
vc_hurt_light3 = sfx_vc_sarina_hit6; //if damage is under 50%
vc_hurt_light4 = sfx_vc_sarina_hit9; //if damage is under 50%
vc_hurt_light5 = sfx_vc_sarina_hit11; //if damage is under 50%
vc_hurt_light6 = sfx_vc_sarina_hit15; //if damage is under 50%
vc_hurt_light7 = sfx_vc_sarina_hit16; //if damage is under 50%
vc_hurt_med1 = sfx_vc_sarina_hit2; //if damage is over 50% but under 100%
vc_hurt_med2 = sfx_vc_sarina_hit3; //if damage is over 50% but under 100%
vc_hurt_med3 = sfx_vc_sarina_hit4; //if damage is over 50% but under 100%
vc_hurt_med4 = sfx_vc_sarina_hit7; //if damage is over 50% but under 100%
vc_hurt_med5 = sfx_vc_sarina_hit8; //if damage is over 50% but under 100%
vc_hurt_med6 = sfx_vc_sarina_hit10; //if damage is over 50% but under 100%
vc_hurt_hard1 = sfx_vc_sarina_hit12; //if damage is over 100%
vc_hurt_hard2 = sfx_vc_sarina_hit13; //if damage is over 100%
vc_hurt_hard3 = sfx_vc_sarina_hit14; //if damage is over 100%

vc_parried1 = sfx_nothing;
vc_parried2 = sfx_nothing;
vc_ko = sfx_vc_takia_ko1;
vc_ko2 = sfx_vc_takia_ko1;
vc_ko3 = sfx_vc_takia_ko1;
#endregion
#endregion

#region Particle effects

      #region Sarina N-special full charge
	  
	  sarina_nspecial_effect = false;
	  
	  #region Aura behind her	  
      nspecial_particles = part_system_create();
      part_system_depth(nspecial_particles, 400); 
      //back auraParticle Types
      global.pt_level_high = part_type_create();
      part_type_shape(global.pt_level_high, pt_shape_sphere);
      part_type_size(global.pt_level_high, 1, 1, 0.05, 0);
      part_type_scale(global.pt_level_high, .50, .50);
      part_type_orientation(global.pt_level_high, 0, 0, 0, 0, 0);
      part_type_color3(global.pt_level_high, 2631935, 8421631, 255);
      part_type_alpha3(global.pt_level_high, 1, 0.50, 0);
      part_type_blend(global.pt_level_high, 1);
      part_type_life(global.pt_level_high, 30, 30);
      part_type_speed(global.pt_level_high, 1, 3, 0, 0);
      part_type_direction(global.pt_level_high, 0, 180, 0, 0);
      part_type_gravity(global.pt_level_high, 0.20, 90);
	  //back aura Emitters
      global.pe_level_high = part_emitter_create(nspecial_particles);

	  #endregion

	  
	  
	  #endregion


#endregion

ex_flash = false;
ex_flash_timer = 0;

parry_landed = false;

//Sarina's specific Variables

sarina_ftilt_ex = false;

//Nspecial variables
sarina_nspecial_charge = 0;
sarina_nspecial_swing = false;

//Uspecial variables
sarina_uspecial_ground_ex = false;
sarina_uspecial_air_ex = false;

//Fspecial variables
sarina_fspecial_ground_ex = false;
sarina_fspecial_air_ex = false;

//This variable checks to see if sarina has done the slide kick.
sarina_dspecial_slidekick = false;

//Down Special EX Dive kick
sarina_dspecial_ex_dive = false;
sarina_dspecial_ex_dive_land = false;

//This variable checks to see if sarina has done the slide kick for the grounded version.
//If it's false, the grounded version will not do the leap.
//If it's true, the player has confirmed doing the leap.
sarina_dspecial_slidekick_attack = false;