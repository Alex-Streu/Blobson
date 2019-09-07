/// @description Initialize properties
event_inherited();

enum TEXT_FIELD_TYPE
{
	PROFILE,
	CONFIG
}

index = -1;
text = [];
type = -1;
limits = [];
limits[TEXT_FIELD_TYPE.PROFILE] = 6;
limits[TEXT_FIELD_TYPE.CONFIG] = 3;