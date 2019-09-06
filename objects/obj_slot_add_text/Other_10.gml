/// @description Click event

// Inherit the parent event
event_inherited();

if (isNew)
{
	isNew = false
	field.index++;
	field.text[field.index] = characters[index];
}
else
{
	index++;
	if (index >= array_length_1d(characters)) { index = 0; }
	field.text[field.index] = characters[index];
}

alarm[0] = timeLimit;