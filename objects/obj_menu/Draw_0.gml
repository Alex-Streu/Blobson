/// @description Draw menu
if (page == undefined) { return; }

var _startX = 0;
var _startY = 0;
if (owner != noone) 
{
	_startX = owner.x - owner.sprite_xoffset;
	_startY = owner.y - owner.sprite_yoffset;
}

var _items = page;

for (var i = 0; i < ds_list_size(_items); i++)
{
	var _item = _items[| i];
	if (_item[? "Type"] == undefined) { continue; }
	
	switch (_item[? "Type"])
	{
		case MENU_ITEM_TYPE.TEXT:
			if (_item[? "Position"] == undefined 
				|| _item[? "Text"] == undefined)
			{ break; }
			
			//Handle null values
			if (_item[? "Font"] == undefined) { _item[? "Font"] = global.base_font; }
			if (_item[? "FontScale"] == undefined) { _item[? "FontScale"] = 1; }
			if (_item[? "HAlign"] == undefined) { _item[? "HAlign"] = fa_left; }
			
			var _p = _item[? "Position"];
			
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_set_font(_item[? "Font"]);
			draw_set_halign(_item[? "HAlign"]);
			draw_text_transformed(_startX + _p[0], _startY + _p[1], _item[? "Text"], _item[? "FontScale"], _item[? "FontScale"], 0);
			break;
			
		case MENU_ITEM_TYPE.SPRITE:
			if (_item[? "Position"] == undefined
				|| _item[? "Sprite"] == undefined)
			{ break; }
			
			//Handle null values
			if (_item[? "Subimg"] == undefined) { _item[? "Subimg"] = 0; }
			
			var _p = _item[? "Position"];
			
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_sprite(_item[? "Sprite"], _item[? "Subimg"], _startX + _p[0], _startY + _p[1]);
			break;
	}
}