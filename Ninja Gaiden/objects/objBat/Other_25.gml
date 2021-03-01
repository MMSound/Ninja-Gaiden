/// @description Movement

//i really should have made a better engine
if (room != rmAct6Scene2 || room != rmAct6Scene3)
{
	xspeed = (1 * image_xscale);
}
else
{
	xspeed = ((1 * image_xscale) * inside_view(32));
}

//animate
if (image_index < 3)
{
	if (flapTimer % 2 == 0)
	{
		image_index++;
	}
}

//flap
if (room != rmAct6Scene2 || room != rmAct6Scene3)
{
	if (flapTimer % 30 == 0)
	{
		yspeed = -3.75;
		image_index = 0;
	}

	yspeed += 0.25;
	
	flapTimer++;
}
else
{
	if (inside_view(32))
	{
		if (flapTimer % 30 == 0)
		{
			yspeed = -3.75;
			image_index = 0;
		}

		yspeed += 0.25;
	
		flapTimer++;
	}
	else
	{
		yspeed = 0;
		y = ystart;
		flapTimer = 0;
	}
}