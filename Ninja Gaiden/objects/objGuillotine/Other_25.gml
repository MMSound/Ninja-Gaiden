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

//move our guillotine man back into phase 1
if (canDestroyTimer > 2)
{
	if (place_meeting(x, (y + 8), objGuillotineMan))
	{
		with (instance_place(x, (y + 8), objGuillotineMan))
		{
			phase = 2;
		}
		instance_destroy(id);
	}
}

canDestroyTimer++;