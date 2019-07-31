///@func set_hitbox_property(hitbox,property,value,[extra])
///@param hitbox
///@param property
///@param value
///@param [extra]
///@desc Sets a property of the given hitbox
var _hitbox = argument[0];
var _property = argument[1];
var _value = argument[2];
with (_hitbox)
	{
	switch(_property)
		{
		case HITBOX.shape:
			if (_value == HITBOX_SHAPE.rectangle || _value == HITBOX_SHAPE.circle || _value == HITBOX_SHAPE.sprite || _value == HITBOX_SHAPE.rotation)
				{
				shape = _value;
				//Sprite
				switch(shape)
					{
					case HITBOX_SHAPE.rectangle:
						sprite_index=spr_hitbox_rectangle;
						break;
					case HITBOX_SHAPE.circle:
						sprite_index=spr_hitbox_circle;
						break;
					case HITBOX_SHAPE.sprite:
						sprite_index=argument_count>3 ? argument[3] : overlay_sprite;
						break;
					case HITBOX_SHAPE.rotation:
						sprite_index=spr_hitbox_rotation;
						if (argument_count>3) image_angle = argument[3];
						break;
					}
				}
			break;
		case HITBOX.sprite_angle:
			image_angle = owner.facing == 1 ? _value : -_value;
			break;
		case HITBOX.knockback_state:
			knockback_state = _value;
			break;
		case HITBOX.base_hitlag:
			base_hitlag = _value;
			break;
		case HITBOX.priority:
			priority = _value;
			break;
		case HITBOX.angle:
			angle = _value % 360;
			drawing_angle=angle_flipper==FLIPPER.standard ? apply_angle_flipper(angle,angle_flipper,owner) : angle;
			break;
		case HITBOX.grounded_angle:
			grounded_angle = _value % 360;
			break;
		}
	}