/// @description Control speed
if (lifeTimer < lifeTime)
{
	xspeed = (image_xscale * moveSpeed);
	if (in_range(lifeTimer, 0, (lifeTime - 10)))
	{
		image_index = 0;
	}
	else if (in_range(lifeTimer, (lifeTime - 10), (lifeTime - 5)))
	{
		image_index = 1;
		moveSpeed = 2;
	}
	else if (in_range(lifeTimer, (lifeTime - 5), lifeTime))
	{
		image_index = 2;
		moveSpeed = 1;
	}
	lifeTimer++;
}
else
{
	instance_destroy(id);
}