/// @description Flash
if (!game_paused())
{
	image_speed = imgSpd;
	
	if (xspeed > 0)
	{
		xspeed -= 0.5;
		xspeedReal = floor(xspeed);
		drawX += xspeedReal;
	}
}
else
{
	image_speed = 0;
}

depth = 155;