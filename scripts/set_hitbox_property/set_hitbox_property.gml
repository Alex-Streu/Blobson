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
		case HITBOX_PROPERTY.shape:
			if (_value == HITBOX_SHAPE.rectangle || _value == HITBOX_SHAPE.circle || _value == HITBOX_SHAPE.rotation)
				{
				shape = _value;
				//Sprite
				switch(shape)
					{
					case HITBOX_SHAPE.rectangle:
						sprite_index = spr_hitbox_rectangle;
						break;
					case HITBOX_SHAPE.circle:
						sprite_index = spr_hitbox_circle;
						break;
					case HITBOX_SHAPE.rotation:
						sprite_index = spr_hitbox_rotation;
						if (argument_count > 3) image_angle = argument[3];
						break;
					}
				}
			else if (sprite_exists(_value))
				{
				shape = _value;
				sprite_index = _value;
				image_xscale *= owner.facing;
				}
			break;
		case HITBOX_PROPERTY.sprite_angle:
			image_angle = owner.facing == 1 ? _value : -_value;
			break;
		case HITBOX_PROPERTY.knockback_state:
			knockback_state = _value;
			break;
		case HITBOX_PROPERTY.base_hitlag:
			base_hitlag = _value;
			break;
		case HITBOX_PROPERTY.priority:
			priority = _value;
			break;
		case HITBOX_PROPERTY.angle:
			angle = _value % 360;
			drawing_angle = angle_flipper == FLIPPER.standard ? apply_angle_flipper(angle, angle_flipper,owner) : angle;
			break;
		case HITBOX_PROPERTY.grounded_angle:
			grounded_angle = _value % 360;
			break;
		case HITBOX_PROPERTY.hit_fx_style:
			if (_value >= 0 && _value < HIT_FX.length)
				{
				hit_fx_style = _value;
				}
			break;
		case HITBOX_PROPERTY.hit_sfx:
			hit_sfx = _value;
			break;
		}
	}