/// @description Wacky Effect!
event_inherited();

if (!instance_exists(objPixelation))
{
	instance_create_depth(x, y, depth, objPixelation);
}