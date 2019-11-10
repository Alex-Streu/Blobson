
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