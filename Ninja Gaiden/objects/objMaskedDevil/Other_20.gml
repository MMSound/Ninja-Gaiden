/// @description Collision
if (coll_x(image_xscale, objSolid))
{
	image_xscale *= -1;
	if (phase == 0)
	{
		bounceCount++;
	}
}