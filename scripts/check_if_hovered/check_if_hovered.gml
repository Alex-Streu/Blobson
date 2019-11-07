///@func check_if_hovered()
var _isHovered = false;
var _owner = owner;
with (instance_place(x, y, obj_player_cursor))
{
	if (owner != _owner) { continue; }
	_isHovered = true;
}

isHovered = _isHovered;