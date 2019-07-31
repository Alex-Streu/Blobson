///@func Profile_Change(profile_map,setting,value,[extra...])
///@param profile_map
///@param setting
///@param value
///@param [extra...]
var _map = argument[0],
	_setting = argument[1],
	_val = argument[2],
	_key = "";

//Get the correct key
switch(_setting)
	{
	case PROFILE.name: _key =				"NAME"; break;
	case PROFILE.wins: _key =				"WINS"; break;
	case PROFILE.games_played: _key =		"GAME"; break;
	case PROFILE.custom_controls: _key =	"CC";	break;
	case PROFILE.favorite_skins: _key =		"FAV";	break;
	case PROFILE.color: _key =				"COL";	break;
	}

_map[? _key] = _val;