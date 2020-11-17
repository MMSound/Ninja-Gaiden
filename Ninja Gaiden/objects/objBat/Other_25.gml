/// @description Movement
xspeed = (1 * image_xscale);

//animate
if (image_index < 3)
{
	if (flapTimer % 2 == 0)
	{
		image_index++;
	}
}

//flap
if (flapTimer % 30 == 0)
{
	yspeed = -3.75;
	image_index = 0;
}

yspeed += 0.25;

flapTimer++;