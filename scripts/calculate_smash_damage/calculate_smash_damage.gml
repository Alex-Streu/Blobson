///@func calculate_smash_damage(base_damage,[smash_charge],[max],[multiplier])
///@param base_damage
///@param [smash_charge]
///@param [max]
///@param [multiplier]
var _dmg =		argument[0],
	_charge =	argument_count > 1 ? argument[1] : smash_charge,
	_max =		argument_count > 2 ? argument[2] : smash_attack_max_charge,
	_mult =		argument_count > 3 ? argument[3] : smash_attack_multiplier;
return floor(_dmg * (1 + (_charge / _max) * _mult));