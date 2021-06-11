/// @description Move
if (grounded())
{
	yspeed = -3;
}
xspeed = image_xscale;
if (++lifeTimer == lifeTime)
{
	instance_destroy(id);
}