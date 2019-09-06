/// @description Y Click event

// Inherit the parent event
event_inherited();

if (profile[? "IsDefault"]) { return true; }

if (isDeleting)
{
	deleteProgress = 0;
	isDeleting = false;
}
else
{
	isDeleting = true;
}