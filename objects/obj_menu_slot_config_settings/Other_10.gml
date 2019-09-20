/// @description Create pages

// Inherit the parent event
event_inherited();

//Top page title
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, 15 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = titles[pageIndex];
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

switch (pageIndex)
{
	case 0:
		#region Settings Page
		
		//Draw settings
		var textColumn = owner.sprite_width / 3 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (sprite_get_width(object_get_sprite(obj_slot_config_switch)) / 2) + 10;

		//Create Tap Jump row
		var startY = 50;
		var item = ds_map_create();
		item[? "Position"] = [ textColumn, startY ];
		item[? "Type"] = MENU_ITEM_TYPE.TEXT;
		item[? "Text"] = "TAP JUMP";
		item[? "Font"] = fnt_consolas;
		item[? "HAlign"] = fa_center;
		ds_list_add(page, item);
		
		item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_switch);
		item.owner = owner;
		item.name = "TapJump";
		ds_list_add(pageObjects, item);


		//Create Rumble row
		startY += 40;
		item = ds_map_create();
		item[? "Position"] = [ textColumn, startY ];
		item[? "Type"] = MENU_ITEM_TYPE.TEXT;
		item[? "Text"] = "RUMBLE";
		item[? "Font"] = fnt_consolas;
		item[? "HAlign"] = fa_center;
		ds_list_add(page, item);
		
		item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_switch);
		item.owner = owner;
		item.name = "Rumble";
		item.setting = owner.config[? "Rumble"];
		ds_list_add(pageObjects, item);
		
		
		//Create Reset button
		item = instance_create_layer(hcenter_item(owner.x, owner.sprite_width, sprite_get_width(object_get_sprite(obj_slot_config_reset))), owner.y + 120, "MenuLayer", obj_slot_config_reset);
		item.owner = owner;
		ds_list_add(pageObjects, item);
		
		
		#endregion
		break;
	case 1:		
		#region Moves Page (1/2)
		
		//Draw settings
		var textColumn = owner.sprite_width / 3 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (sprite_get_width(object_get_sprite(obj_slot_config_controls)) / 2) + 10;

		//Create rows
		var baseY = 45;
		for (var i = 0; i < array_length_1d(moves)/2; i += 2)
		{		
			var startY = baseY + 20*i;
			
			var item = ds_map_create();
			item[? "Position"] = [ textColumn, startY ];
			item[? "Type"] = MENU_ITEM_TYPE.TEXT;
			item[? "Text"] = moves[i];
			item[? "Font"] = fnt_consolas;
			item[? "HAlign"] = fa_center;
			ds_list_add(page, item);
		
			item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_controls);
			item.owner = owner;
			item.name = moves[i+1];
			ds_list_add(pageObjects, item);
		}		
		
		#endregion
		break;
	case 2:		
		#region Moves Page (2/2)
		
		//Draw settings
		var textColumn = owner.sprite_width / 3 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (sprite_get_width(object_get_sprite(obj_slot_config_controls)) / 2) + 10;

		//Create rows
		var baseY = 45;
		for (var i = array_length_1d(moves)/2; i < array_length_1d(moves); i += 2)
		{		
			var startY = baseY + 20*(i - array_length_1d(moves)/2);
			
			var item = ds_map_create();
			item[? "Position"] = [ textColumn, startY ];
			item[? "Type"] = MENU_ITEM_TYPE.TEXT;
			item[? "Text"] = moves[i];
			item[? "Font"] = fnt_consolas;
			item[? "HAlign"] = fa_center;
			ds_list_add(page, item);
		
			item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_controls);
			item.owner = owner;
			item.name = moves[i+1];
			ds_list_add(pageObjects, item);
		}		
		
		#endregion
		break;
	case 3:		
		#region Team Page
		
		//Draw settings
		var textColumn = owner.sprite_width / 3 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (sprite_get_width(object_get_sprite(obj_slot_config_controls)) / 2) + 10;

		//Create rows
		var baseY = 40;
		for (var i = 0; i < array_length_1d(teamMoves); i += 2)
		{		
			var startY = baseY + 15*i;
			
			var item = ds_map_create();
			item[? "Position"] = [ textColumn, startY ];
			item[? "Type"] = MENU_ITEM_TYPE.TEXT;
			item[? "Text"] = teamMoves[i];
			item[? "Font"] = fnt_consolas;
			item[? "HAlign"] = fa_center;
			ds_list_add(page, item);
		
			item = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_controls);
			item.owner = owner;
			item.name = teamMoves[i+1];
			ds_list_add(pageObjects, item);
		}		
		
		#endregion
		break;
	case 4:		
		#region Sensitivity Page
		
		//Draw settings
		var _controlWidth = sprite_get_width(object_get_sprite(obj_slot_config_sensitivity)) 
						+ sprite_get_width(object_get_sprite(obj_slot_config_sensitivity_control_l))
						+ sprite_get_width(object_get_sprite(obj_slot_config_sensitivity_control_r));
		var textColumn = owner.sprite_width / 4 - 10;
		var btnColumn = owner.x + (owner.sprite_width / 3) * 2 - (_controlWidth / 2) + 10;

		//Create rows
		var baseY = 40;
		for (var i = 0; i < array_length_1d(sensitivities); i += 2)
		{		
			var startY = baseY + 15*i;
			
			var item = ds_map_create();
			item[? "Position"] = [ textColumn, startY ];
			item[? "Type"] = MENU_ITEM_TYPE.TEXT;
			item[? "Text"] = sensitivities[i];
			item[? "Font"] = fnt_consolas;
			item[? "HAlign"] = fa_center;
			ds_list_add(page, item);
		
			var left = instance_create_layer(btnColumn, owner.y + startY - 15, "MenuLayer", obj_slot_config_sensitivity_control_l);
			left.owner = owner;
			
			var ctrl = instance_create_layer(left.x + left.sprite_width, owner.y + startY - 15, "MenuLayer", obj_slot_config_sensitivity);
			ctrl.owner = owner;
			ctrl.name = sensitivities[i+1];
			ds_list_add(pageObjects, ctrl);
			
			var right = instance_create_layer(ctrl.x + ctrl.sprite_width, owner.y + startY - 15, "MenuLayer", obj_slot_config_sensitivity_control_r);
			right.owner = owner;
			
			left.field = ctrl;
			right.field = ctrl;
			ds_list_add(pageObjects, left);
			ds_list_add(pageObjects, right);
		}		
		
		#endregion
		break;
}

//Create back button
var _h = sprite_get_height(object_get_sprite(obj_slot_back));
var item = instance_create_layer(owner.x + 10, owner.y + owner.sprite_height - _h - 10, "MenuLayer", obj_slot_back);
item.owner = owner;
		
ds_list_add(pageObjects, item);

//Bottom page index
var item = ds_map_create();
item[? "Position"] = [ owner.sprite_width/2, owner.sprite_height - 15 ];
item[? "Type"] = MENU_ITEM_TYPE.TEXT;
item[? "Text"] = stringify("{0}/{1}", pageIndex + 1, pageTotal);
item[? "Font"] = fnt_consolas;
item[? "HAlign"] = fa_center;
ds_list_add(page, item);

//Load config settings
var _config = owner.config;
with (obj_slot_config_setting)
{
	setting = _config[? name];
}