/// @description Movement
xspeed = (moveSpeed * image_xscale);

//constantly add gravity
if (image_xscale == -1.00)
{
	moveSpeed += (0.25 * image_xscale);
}
else
{
	moveSpeed -= (0.25 * image_xscale);
}

//move our hammer man back into phase 1
if (place_meeting(x, (y + 8), objHammerMan))
{
	with (instance_place(x, (y + 8), objHammerMan))
	{
		phase = 2;
	}
	instance_destroy(id);
}