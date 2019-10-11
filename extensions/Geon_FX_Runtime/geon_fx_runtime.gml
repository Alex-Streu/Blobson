#define geon_effect_add
/// geon_effect_add(filename, ps, [sprite_array], [ps_add])
///
/// @description  Loads new effect from a file fname and uses particle system ps to play it. 
/// If effect has already been loaded the script copies all effect settings and creates new emitters only.
/// @param {string} fname - filename
/// @param {real} ps - particle system to play file
/// @param {real} [sprite_array] - an array of sprites to replace emitter sprites in the effect
/// @param {bool} [ps_add] - particle system for add blended particles 

var filename, ps, present_effect_system_ind, new_effect_system_ind, spr_array;

filename = argument[0];
ps = argument[1];
spr_array = noone; 
var ps_add = -1;
if argument_count > 2 spr_array = argument[2];
if argument_count > 3 ps_add = argument[3];

if !part_system_exists(ps) ps = global.geonfx_ps; //If provided particle system does not exist, use default one

new_effect_system_ind = geon_effect_read(filename, ps, spr_array, ps_add);
//present_effect_system_ind = geon_effect_id(filename);
//if present_effect_system_ind = -1 new_effect_system_ind = geon_effect_read(filename, ps, spr_array);
//else new_effect_system_ind = geon_effect_copy(present_effect_system_ind, ps);

return new_effect_system_ind;


#define geon_effect_add_to_list
/// @description  geon_effect_add_to_list(effect_map);
/// @param effect_map

//  Adds effect to global effects list and return effect id

/// http://www.steampanic.com/geonfx/

var list = global.effect_systems_list;
var effect_system = argument0;
var size = ds_list_size(list);
var ind = 0;

if size = 0
{
    ds_list_add(list, effect_system);
    return 0;
}
else
{
    for (var i = 0; i < size; i += 1)
    {
        ind = ds_list_find_value(list, i);
        if ind = -1
        {
            ds_list_replace(list, i, effect_system);
            return i; 
        }    
    }
    
    ds_list_add(list, effect_system);
    return size; 
}


#define geon_effect_burst
/// geon_effect_burst(effect_ind, x, y);
/// @description Play effect with index effect_ind at x, y once
/// @param effect_ind
/// @param  x
/// @param  y
/// @param  [direction|gravity_direction|speed_multiplier|gravity_multiplier]

var effect_ind, xp, yp;
effect_ind = argument[0];
xp = argument[1];
yp = argument[2];

if effect_ind < 0 return -1;

var eff_param_def = [0, 0, 1, 1]; //direction, gravity_direction, speed_multiplier, gravity_multiplier
if argument_count > 3 
{
	var eff_param = argument[3];  
	var len = array_length_1d(eff_param);
	var max_len = array_length_1d(eff_param_def);
	if len < max_len
	{
		for (var i = len; i < max_len; i += 1)
		{
			eff_param[i] = eff_param_def[i];
		}
	}
}

var map = ds_list_find_value(global.effect_systems_list, effect_ind);
if ds_exists(map, ds_type_map)
{  
    var i, size;
    size = map[? "effects"];
    for (i = size-1; i >= 0; i -= 1)
    {
        var ind, ps, pt, xadd, yadd, count;
        ind = string(i);
        ps = map[? "ps"+ind];
        pt = map[? "pt"+ind];
        xadd = map[? "xadd"+ind];
        yadd = map[? "yadd"+ind];
        count = map[? "count"+ind];
        
        if argument_count > 3 
		{
			var ddir = point_direction(0, 0, xadd, yadd);
			var ddis = point_distance(0, 0, xadd, yadd);
			xadd = lengthdir_x(ddis, eff_param[geon_param.dir]+ddir);
			yadd = lengthdir_y(ddis, eff_param[geon_param.dir]+ddir);
				
			var dir_min, dir_max, dir_incr, dir_wiggle, speed_min, speed_max, speed_incr, speed_wiggle, grav_amount, grav_dir;
		
			dir_min = map[? "pt"+ind+"_"+"partdirmin"];
			dir_max = map[? "pt"+ind+"_"+"partdirmax"];
			var dir_mid = (dir_min + dir_max) / 2;
			//dir_min -= dir_mid;
			//dir_max -= dir_mid; 
			dir_incr = map[? "pt"+ind+"_"+"partdirincr"];
			dir_wiggle = map[? "pt"+ind+"_"+"partdirwig"];
			speed_min = map[? "pt"+ind+"_"+"partspdmin"];
			speed_max = map[? "pt"+ind+"_"+"partspdmax"];
			speed_incr = map[? "pt"+ind+"_"+"partspdincr"];
			speed_wiggle = map[? "pt"+ind+"_"+"partspdwig"];
			grav_amount = map[? "pt"+ind+"_"+"partgrav"];
			grav_dir = map[? "pt"+ind+"_"+"partgravdir"];
			part_type_direction(pt, eff_param[geon_param.dir] + dir_min, eff_param[geon_param.dir] + dir_max, dir_incr, dir_wiggle);
			part_type_speed(pt, eff_param[geon_param.spd] * speed_min, eff_param[geon_param.spd] * speed_max, speed_incr, speed_wiggle);
			part_type_gravity(pt, eff_param[geon_param.gravspd] * grav_amount, eff_param[geon_param.gravdir] + grav_dir);
		}
            
        if ds_map_exists(map, "pe"+ind)
        {
            var pe, width, height, shape, distr;
            
			pe = map[? "pe"+ind];
            width = map[? "width"+ind];
            height = map[? "height"+ind];
            shape = map[? "shape"+ind];
            distr = map[? "distr"+ind];
                
			part_emitter_region(ps, pe, xp+xadd-width, xp+xadd+width, yp+yadd-height, yp+yadd+height, shape, distr);
            part_emitter_burst(ps, pe, pt, count);
        }
        else
        {
            if !ds_map_exists(map, "parent") part_particles_create(ps, xp+xadd, yp+yadd, pt, count);
        }
    }
    map[? "x"] = xp;
    map[? "y"] = yp;
}    


#define geon_effect_delete
/// @description  geon_effect_delete(effect_ind, clear_pt);
/// @param effect_ind
/// @param clear_pt

//  Removes effect with index effect_ind from memory. If ( clear_pt == true ) particle types will be destroyed too. 

/// http://www.steampanic.com/geonfx/

var effect_ind = argument0;
var clear_pt = argument1;

if !ds_exists(global.effect_systems_list, ds_type_list) exit;

var map = ds_list_find_value(global.effect_systems_list, effect_ind);

if !is_undefined(map) and ds_exists(map, ds_type_map)
{
    var effects = real(map[? "effects"]); //Counting subeffects
    var copy = ds_map_exists(map, "copy_of");

    for (var i = 0; i < effects; i += 1) //Cycling through them
    {
        var ind = string(i);
        
        var pt = real(map[? "pt"+ind]);
        var ps = real(map[? "ps"+ind]);
        
        if clear_pt
        {
            if part_type_exists(pt) part_type_destroy(pt); //Destroying particle types
        }
        
        if ds_map_exists(map, "pe"+ind)
        {
            if part_system_exists(ps)
            {
                var pe = real(map[? "pe"+ind]);
                if part_emitter_exists(ps, pe) part_emitter_destroy(ps, pe); //Destroying emitters
            }
        }
    }
    
    if copy or clear_pt 
    {
        ds_map_destroy(map); //Destroying the map with all effect system data
        if effect_ind == ds_list_size(global.effect_systems_list)-1 { ds_list_delete(global.effect_systems_list, effect_ind); }
        else ds_list_replace(global.effect_systems_list, effect_ind, -1);
    }
}


#define geon_effect_id
/// @description  geon_effect_id(fname);
/// @param fname

//  Returns effect id by filename (if effect is loaded). Or -1 is effect doesn't exist in memory.

/// http://www.steampanic.com/geonfx/

var filename, size, map, i, map_fname;

filename = argument0;

size = ds_list_size(global.effect_systems_list);
    
for (i = 0; i < size; i += 1) 
{
    map = ds_list_find_value(global.effect_systems_list, i);
    if ds_exists(map, ds_type_map)
    {
        map_fname = ds_map_find_value(map, "filename");
        if map_fname == filename return i;
    }
}
    
return -1;


#define geon_effect_init
/// @description geon_effect_init(effect_system_map, effect_map, effect_index, ps, [sprite_array]);
/// @param effect_system_map
/// @param effect_map
/// @param effect_index
/// @param ps
/// @param [sprite_replacement_array]
/// @param [ps_add]

//  Creates particle types and emitters. Applies all data gathered from a file. Is called from geon_effect_add().

/// http://www.steampanic.com/geonfx/

var effect_system_map = argument[0]
var effect_map = argument[1];
var ind = argument[2];
var ps = argument[3];
var ps_add = -1;
var sprite_replacement = noone;
if argument_count > 4 sprite_replacement = argument[4];
if argument_count > 5 ps_add = argument[5];

if sprite_replacement < 0 sprite_replacement = noone;

var partshape = pt_shape_pixel;
var shape = ps_shape_rectangle;
var distr = ps_distr_linear;

//Converting shape names to shape ids 
switch effect_map[? "partshape_name"]
{
    case "pt_shape_pixel": partshape = pt_shape_pixel; break;
    case "pt_shape_disk": partshape = pt_shape_disk; break;
    case "pt_shape_square": partshape = pt_shape_square; break;
    case "pt_shape_line": partshape = pt_shape_line; break;
    case "pt_shape_star": partshape = pt_shape_star; break;
    case "pt_shape_circle": partshape = pt_shape_circle; break;
    case "pt_shape_ring": partshape = pt_shape_ring; break;
    case "pt_shape_sphere": partshape = pt_shape_sphere; break;
    case "pt_shape_flare": partshape = pt_shape_flare; break;
    case "pt_shape_spark": partshape = pt_shape_spark; break;
    case "pt_shape_explosion": partshape = pt_shape_explosion; break;
    case "pt_shape_cloud": partshape = pt_shape_cloud; break;
    case "pt_shape_smoke": partshape = pt_shape_smoke; break;
    case "pt_shape_snow": partshape = pt_shape_snow; break;
}

switch effect_map[? "shape_name"] 
{
    case "ps_shape_line": shape = ps_shape_line; break;
    case "ps_shape_ellipse": shape = ps_shape_ellipse; break;
    case "ps_shape_rectangle": shape = ps_shape_rectangle; break;
    case "ps_shape_diamond": shape = ps_shape_diamond; break;
}

switch effect_map[? "distr_name"]
{
    case "ps_distr_linear": distr = ps_distr_linear; break;
    case "ps_distr_gaussian": distr = ps_distr_gaussian; break;
    case "ps_distr_invgaussian": distr = ps_distr_invgaussian; break;
}

//Reading particle type values from a temp map
var partsizemin = real(effect_map[? "partsizemin"]);
var partsizemax = real(effect_map[? "partsizemax"]);
var partsizeincr = real(effect_map[? "partsizeincr"]);
var partsizewig = real(effect_map[? "partsizewig"]);

var partscalex = real(effect_map[? "partscalex"]);
var partscaley = real(effect_map[? "partscaley"]);

var partorimin = real(effect_map[? "partorimin"]);
var partorimax = real(effect_map[? "partorimax"]);
var partoriincr = real(effect_map[? "partoriincr"]);
var partoriwig = real(effect_map[? "partoriwig"]);
var partorirel = real(effect_map[? "partorirel"]);

var partcolone = real(effect_map[? "partcolone"]);
var partcoltwo = real(effect_map[? "partcoltwo"]);
var partcolthr = real(effect_map[? "partcolthr"]);

var partalpone = real(effect_map[? "partalpone"]);
var partalptwo = real(effect_map[? "partalptwo"]);
var partalpthr = real(effect_map[? "partalpthr"]);

var partblend = real(effect_map[? "partblend"]);

var partlifemin = real(effect_map[? "partlifemin"]);
var partlifemax = real(effect_map[? "partlifemax"]);

var partspdmin = real(effect_map[? "partspdmin"]);
var partspdmax = real(effect_map[? "partspdmax"]);
var partspdincr = real(effect_map[? "partspdincr"]);
var partspdwig = real(effect_map[? "partspdwig"]);

var partdirmin = real(effect_map[? "partdirmin"]);
var partdirmax = real(effect_map[? "partdirmax"]);
var partdirincr = real(effect_map[? "partdirincr"]);
var partdirwig = real(effect_map[? "partdirwig"]);

var partgrav = real(effect_map[? "partgrav"]);
var partgravdir = real(effect_map[? "partgravdir"]);

var animat = geon_real(effect_map[? "animat"]);
var stretch = geon_real(effect_map[? "stretch"]);
var rand = geon_real(effect_map[? "rand"]);

//Emitter settings
var xadd = real(effect_map[? "xadd"]);
var yadd = real(effect_map[? "yadd"]);

var width = real(effect_map[? "width"]);
var height = real(effect_map[? "height"]);

var count = real(effect_map[? "count"]);
var name = effect_map[? "name"];

var part_form = geon_real(effect_map[? "part_form"]);

//Defining particle type 
var part = part_type_create();
part_type_shape(part, partshape)
part_type_size(part, partsizemin, partsizemax, partsizeincr, partsizewig);
part_type_scale(part, partscalex, partscaley);
part_type_orientation(part, partorimin, partorimax, partoriincr, partoriwig, partorirel);
part_type_colour3(part, partcolone, partcoltwo, partcolthr);
part_type_alpha3(part, partalpone, partalptwo, partalpthr);
part_type_blend(part, partblend);
part_type_life(part, partlifemin, partlifemax);
part_type_speed(part, partspdmin, partspdmax, partspdincr, partspdwig);
part_type_direction(part, partdirmin, partdirmax, partdirincr, partdirwig);
part_type_gravity(part, partgrav, partgravdir);

if part_form < 2
{
    var spr_name = "";
    if part_form == 0 { spr_name = "spr_"+effect_map[? "partshape_name"]; } //GMS 1 particle shape
    else if part_form == 1 { spr_name = "spr_"+effect_map[? "partshape_name"]+"_new"; } //GMS 2 particle shape
    
    var spr_ind = asset_get_index(spr_name);
    if spr_ind != -1 and sprite_exists(spr_ind) {  part_type_sprite(part, spr_ind, 0, 0, 0); } 
	else {if sprite_replacement != noone show_error("Sprite doesn't exist", false); }	
}

//Setting sprite as a particle shape
var sprite = string(effect_map[? "sprite"]); 
sprite = string_replace(sprite, filename_ext(sprite), ""); //geon_string_parse(sprite, ".", 0);
var spr_ind = asset_get_index(sprite);
if spr_ind != -1 { if sprite_exists(spr_ind) { part_type_sprite(part, spr_ind, animat, stretch, rand); } }

if sprite_replacement != noone 
{ 
	if sprite_exists(sprite_replacement) {part_type_sprite(part, sprite_replacement, animat, stretch, rand); }
	else show_error("Replacement Sprite doesn't exist", false);
}

var create_emitter = 1;

//Linking Death and Step types
var run_after_name = "";
var run_after_count = 0;
var run_step_name = "";
var run_step_count = 0;

if ds_map_exists(effect_map, "run_after_name")
{
    run_after_name = effect_map[? "run_after_name"];
    run_after_count = real(effect_map[? "run_after_count"]);
    ds_map_add(effect_system_map, "run_after_name"+string(ind), run_after_name);
    ds_map_add(effect_system_map, "run_after_count"+string(ind), run_after_count);
}

if ds_map_exists(effect_map, "run_step_name")
{
    run_step_name = effect_map[? "run_step_name"];
    run_step_count = real(effect_map[? "run_step_count"]);
    ds_map_add(effect_system_map, "run_step_name"+string(ind), run_step_name);
    ds_map_add(effect_system_map, "run_step_count"+string(ind), run_step_count);
}

for (var i = 0; i < ind; i += 1)
{
    var ind_connected = string(i);
    
    if run_after_name != ""
    {
        if effect_system_map[? "name"+ind_connected] == run_after_name
        {
            part_type_death(part, run_after_count, effect_system_map[? "pt"+ind_connected]);
        }
    }
    
    if run_step_name != ""
    {
        if effect_system_map[? "name"+ind_connected] == run_step_name
        {
            part_type_step(part, run_step_count, effect_system_map[? "pt"+ind_connected]);
        }
    }
    
    if ds_map_exists(effect_system_map, "run_after_name"+ind_connected)
    {
        if effect_system_map[? "run_after_name"+ind_connected] == name
        {
            part_type_death(effect_system_map[? "pt"+ind_connected], effect_system_map[? "run_after_count"+ind_connected], part);
            create_emitter = 0;
            ds_map_add( effect_system_map, "parent", real(ind_connected) );
        }
    }
    
    if ds_map_exists(effect_system_map, "run_step_name"+ind_connected)
    {
        if effect_system_map[? "run_step_name"+ind_connected] == name
        {
            part_type_step(effect_system_map[? "pt"+ind_connected], effect_system_map[? "run_step_count"+ind_connected], part);
            create_emitter = 0;
            ds_map_add( effect_system_map, "parent", real(ind_connected) );
        }
    }
}

//PS settings

if partblend == 1 
{
	if ps_add != -1 and part_system_exists(ps_add) ps = ps_add;
}

//Writing to effect_system map
ds_map_add(effect_system_map, "name"+string(ind), name);
ds_map_add(effect_system_map, "ps"+string(ind), ps);
ds_map_add(effect_system_map, "pt"+string(ind), part);
ds_map_add(effect_system_map, "count"+string(ind), count);
ds_map_add(effect_system_map, "xadd"+string(ind), xadd);
ds_map_add(effect_system_map, "yadd"+string(ind), yadd);

//Adding changeable particle_type params
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partdirmin", partdirmin);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partdirmax", partdirmax);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partdirincr", partdirincr);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partdirwig", partdirwig);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partspdmin", partspdmin);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partspdmax", partspdmax);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partspdincr", partspdincr);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partspdwig", partspdwig);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partgrav", partgrav);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partgravdir", partgravdir);
ds_map_add(effect_system_map, "pt"+string(ind)+"_"+"partblend", partblend);

//Creating emitters if necessary
if create_emitter //and (width > 0 or height > 0)
{
	
	//Reading Effect PS
	var pe_ps_name = "";
	if ds_map_exists(effect_map, "pe_ps_name") pe_ps_name = effect_map[? "pe_ps_name"];

	if pe_ps_name != ""
	{
		if string_count("global.", pe_ps_name) > 0
		{
			var pe_ps_var = geon_string_parse(pe_ps_name, ".", 1);
			if variable_global_exists(pe_ps_var)	
			{
				var pe_ps_val = variable_global_get(pe_ps_var);
				if part_system_exists(pe_ps_val) ps = pe_ps_val; else geon_trace("No PS with name: "+pe_ps_var);
			}
			else geon_trace("No such PS var: "+pe_ps_name);
		}
		else
		{
			if variable_instance_exists(id, pe_ps_name)
			{
				var pe_ps_val = variable_instance_get(id, pe_ps_name);	
				if part_system_exists(pe_ps_val) ps = pe_ps_val; else geon_trace("No local PS with name: "+pe_ps_var+" in instance: "+object_get_name(object_index));
			}
			else geon_trace("No such PS var: "+pe_ps_name+" in instance: "+object_get_name(object_index));
		}
	}
	
    var emitter = part_emitter_create(ps);
    ds_map_add(effect_system_map, "pe"+string(ind), emitter);
    ds_map_add(effect_system_map, "width"+string(ind), width);
    ds_map_add(effect_system_map, "height"+string(ind), height);
    ds_map_add(effect_system_map, "shape"+string(ind), shape);
    ds_map_add(effect_system_map, "distr"+string(ind), distr);
}

//Destroying individual effect map
ds_map_destroy(effect_map);

#define geon_effect_is_streamed
/// @description  geon_effect_is_streamed(effect_ind);
/// @param effect_ind

//  Checks whether effect with index effect_ind is being streamed

/// http://www.steampanic.com/geonfx/

var effect_ind;
effect_ind = argument0;

if effect_ind < 0 return -1;

if ds_list_size(global.effect_systems_list) > effect_ind
{
    var map = ds_list_find_value(global.effect_systems_list, effect_ind);
    if ds_exists(map, ds_type_map) 
    {
        if ds_map_exists(map, "streamed") return map[? "streamed"];
    }
}

return -1;

#define geon_effect_read
/// @description  geon_effect_read(fname, ps, [spr_array], [ps_add]);
/// @param fname
/// @param ps
/// @param spr_array
/// @param ps_add

//  Loads new effect from a file fname and uses particle system ps to play it. 

/// http://www.steampanic.com/geonfx/

var ps, filename, file, str, em, effects, effect, key, value, effect_map, effect_system_map, i, spr_array;

filename = argument[0];
ps = argument[1];
spr_array = noone;
if argument_count > 2 spr_array = argument[2];
var ps_add = -1;
if argument_count > 3 ps_add = argument[3];

if !file_exists(filename) { show_error("Effect File doesn't exist", false); return -1; }
file = file_text_open_read(filename);
if file = -1 { file_text_close(file); show_error("Can't open Effect file", false); return -1; }

str = file_text_read_string(file);
if string_count("geon_file_start", str) == 0 { file_text_close(file); return -1; }
var format = real(geon_string_parse(str, "=", 1));

file_text_readln(file);
file_text_readln(file);

if format >= 5
{
    str = file_text_read_string(file);
    
    while str != "" 
    {
        file_text_readln(file);
        str = file_text_read_string(file);
    }
    
    file_text_readln(file);
}

effects = 0; 

while !file_text_eof(file) //Looping through file and parsing 
{
    str = file_text_read_string(file);
    if str != ""
    {
        if string_count("geon_file_end", str) == 0
        {
            effect_map[effects] = ds_map_create();
        
            while str != ""
            {
                key = geon_string_parse(str, "=", 0);
                value = geon_string_parse(str, "=", 1);
                if string_letters(key) != "" ds_map_add(effect_map[effects], key, value);
                file_text_readln(file);
                str = file_text_read_string(file);
            }
                effects += 1;
        }                   
    }
    else
    {
        file_text_readln(file);
    }
}
    
file_text_close(file);

//Updating all effects, linking them together
effect_system_map = ds_map_create();

var spr = noone;
for (i = 0; i < effects; i += 1)
{
	if spr_array != noone
	{
		if is_array(spr_array)
		{
			if array_length_1d(spr_array) > i
			{
				spr = spr_array[i];	
			}
		}
	}
    if ds_exists(effect_map[i], ds_type_map) geon_effect_init(effect_system_map, effect_map[i], i, ps, spr, ps_add);
}
                
ds_map_add(effect_system_map, "filename", filename);
ds_map_add(effect_system_map, "x", 0);
ds_map_add(effect_system_map, "y", 0);
ds_map_add(effect_system_map, "ps", ps);
ds_map_add(effect_system_map, "effects", effects);
ds_map_add(effect_system_map, "streamed", 0);

var effect_system_ind = geon_effect_add_to_list(effect_system_map); //Adding resulting effect_system to global effects list
            
return effect_system_ind;  

#define geon_effect_stream
/// @description  geon_effect_stream(effect_ind, x, y, enable, stream_params);
/// @param effect_ind
/// @param  x
/// @param  y
/// @param  enable
/// @param [stream_params(dir,gravdir,speed,grav)]

//  Enable or disable effect streaming for effect_ind at x, y coordinates.

/// http://www.steampanic.com/geonfx/

var effect_ind, xp, yp, stream, eff_param_def, eff_param;
effect_ind = argument[0];
xp = argument[1];
yp = argument[2];
stream = argument[3];

eff_param_def = [0, 0, 1, 1]; //direction, gravity_direction, speed_multiplier, gravity_multiplier
if argument_count > 4 
{
	eff_param = argument[4];  
	var len = array_length_1d(eff_param);
	var max_len = array_length_1d(eff_param_def);
	if len < max_len
	{
		for (var i = len; i < max_len; i += 1)
		{
			eff_param[i] = eff_param_def[i];
		}
	}
}

if effect_ind < 0 return -1;

var map = ds_list_find_value(global.effect_systems_list, effect_ind);
if is_undefined( map ) then return noone;
if ds_exists(map, ds_type_map)
{  
    if map[? "x"] != xp or map[? "y"] != yp or map[? "streamed"] != stream or argument_count > 4 
    {
        var i, size;
        
        size = map[? "effects"];
        
        for (i = 0; i < size; i += 1)
        {
            var ind, ps, pt, xadd, yadd, count;
            
            ind = string(i);
            
            ps = map[? "ps"+ind];
            pt = map[? "pt"+ind];
            xadd = map[? "xadd"+ind];
            yadd = map[? "yadd"+ind];
            count = map[? "count"+ind];
			
			if argument_count > 4 
			{
				var ddir = point_direction(0, 0, xadd, yadd);
				var ddis = point_distance(0, 0, xadd, yadd);
				xadd = lengthdir_x(ddis, eff_param[geon_param.dir]+ddir);
				yadd = lengthdir_y(ddis, eff_param[geon_param.dir]+ddir);
				
				var dir_min, dir_max, dir_incr, dir_wiggle, speed_min, speed_max, speed_incr, speed_wiggle, grav_amount, grav_dir;
			
				dir_min = map[? "pt"+ind+"_"+"partdirmin"];
				dir_max = map[? "pt"+ind+"_"+"partdirmax"];
				var dir_mid = (dir_min + dir_max) / 2;
				//dir_min -= dir_mid;
				//dir_max -= dir_mid; 
				dir_incr = map[? "pt"+ind+"_"+"partdirincr"];
				dir_wiggle = map[? "pt"+ind+"_"+"partdirwig"];
				speed_min = map[? "pt"+ind+"_"+"partspdmin"];
				speed_max = map[? "pt"+ind+"_"+"partspdmax"];
				speed_incr = map[? "pt"+ind+"_"+"partspdincr"];
				speed_wiggle = map[? "pt"+ind+"_"+"partspdwig"];
				grav_amount = map[? "pt"+ind+"_"+"partgrav"];
				grav_dir = map[? "pt"+ind+"_"+"partgravdir"];
				part_type_direction(pt, eff_param[geon_param.dir] + dir_min, eff_param[geon_param.dir] + dir_max, dir_incr, dir_wiggle);
				part_type_speed(pt, eff_param[geon_param.spd] * speed_min, eff_param[geon_param.spd] * speed_max, speed_incr, speed_wiggle);
				part_type_gravity(pt, eff_param[geon_param.gravspd] * grav_amount, eff_param[geon_param.gravdir] + grav_dir);
			}
			
                                
            if ds_map_exists(map, "pe"+ind)
            {
                var pe, width, height, shape, distr;
                
                pe = map[? "pe"+ind];
                width = map[? "width"+ind];
                height = map[? "height"+ind];
                shape = map[? "shape"+ind];
                distr = map[? "distr"+ind];
                                        
                part_emitter_region(ps, pe, xp+xadd-width, xp+xadd+width, yp+yadd-height, yp+yadd+height, shape, distr);
                if stream part_emitter_stream(ps, pe, pt, count);
                else part_emitter_stream(ps, pe, pt, 0);
            }
        }
        
		if stream != 0
		{
			map[? "x"] = xp;
			map[? "y"] = yp;
		}
        map[? "streamed"] = stream;
    }
}    
else return -1;

#define geon_string_parse
/// @description  geon_string_parse(string, delim, part);
/// @param string
/// @param delimiter ("." for example)
/// @param part to return (0 - left, 1 - right)

//  Cuts a string in two using delimiter.

/// http://www.steampanic.com/geonfx/

var geon_str, geon_part, geon_delim, geon_pos, geon_result, geon_len;
geon_str = argument0;
geon_part = argument2;
geon_result = geon_str;
geon_delim = argument1;
geon_len = string_length(geon_str);

geon_pos = string_pos(geon_delim, geon_str);
if geon_part == 0 geon_result = string_delete(geon_str, geon_pos, geon_len-geon_pos+1);
else if geon_part == 1 geon_result = string_delete(geon_str, 1, geon_pos);

return geon_result;

#define geon_system_destroy
/// @description  geon_system_destroy()

//  Clears Geon FX system and destroys the controller

/// http://www.steampanic.com/geonfx/

var i, size, map;

if !ds_exists(global.effect_systems_list, ds_type_list) exit;

size = ds_list_size(global.effect_systems_list);
    
for (i = 0; i < size; i += 1) geon_effect_delete(i, true); //Removing all effects
    
ds_list_destroy(global.effect_systems_list); //Destroying the list
if global.ps_was_created { if part_system_exists(global.geonfx_ps) part_system_destroy(global.geonfx_ps); } //Destroying particle system if it was created

#define geon_system_init
/// @description  geon_system_init([ps]);
/// @param [ps]

//  Initializes Geon FX system and creates particle system if ps doesn't exist.

/// http://www.steampanic.com/geonfx/

enum geon_param
{
	dir,
	gravdir,
	spd,
	gravspd
}

var ps = noone;
if argument_count > 0 ps = argument[0];

global.geon_con = id;

global.effect_systems_list = ds_list_create();
global.geonfx_ps = noone;
global.ps_was_created = 0;

if !part_system_exists(ps)
{
    global.geonfx_ps = part_system_create();
    part_system_depth(global.geonfx_ps, -99);
    global.ps_was_created = 1;
}
else
{
    global.geonfx_ps = ps;
}

return global.geonfx_ps;

#define geon_sin_shift
/// @description geon_sin_shift(amplitude, period, phase, half);
/// @param amplitude
/// @param  period
/// @param  phase
/// @param  half

var amplitude = argument0, period = argument1, phase = argument2, half = argument3;

if half return abs(amplitude*sin(((pi)/period)*((current_time/1000)+phase)));
else return amplitude*sin(((2*pi)/period)*((current_time/1000)+phase));

#define geon_real
/// @arg value
var value = argument0;
if is_undefined( value ) return 0;
else return real( value );

#define geon_trace
/// @description geon_trace(...)
/// @function geon_trace
/// @param ...
var r = string(argument[0]), i;
for (i = 1; i < argument_count; i++) {
    r += ", " + string(argument[i])
}
show_debug_message(r);

#define geon_effect_copy
/// geon_effect_copy(effect_ind, [ps]);
/// @description Copys the effect with effect_ind and assigns particle system [ps] to play it
/// @param effect_ind
/// @param [ps]

var effect = argument[0];
var ps = -1;
if argument_count > 1 ps = argument[1];
if ps == -1 or !part_system_exists(ps) ps = global.geonfx_ps;

var effect_copy = -1;

    var map, map_copy;
    map = ds_list_find_value(global.effect_systems_list, effect);
    if ds_exists(map, ds_type_map)
    {
        map_copy = ds_map_create();
        ds_map_copy(map_copy, map);
        var effects = map[? "effects"];
        var ind;
        for (var i = 0; i < effects; i += 1)
        {
            ind = string(i);
            if ds_map_exists(map, "pe"+ind)
            {
                //var pe = real(map[? "pe"+ind]);
                var em = part_emitter_create(ps);
                map[? "pe"+ind] = em;
            }
        }
        
        map_copy[? "ps"] = ps;
        map_copy[? "streamed"] = false;
        map_copy[? "copy_of"] = map;
        effect_copy = geon_effect_add_to_list(map_copy);
    }
	
	return effect_copy;


