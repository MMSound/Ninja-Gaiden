/// @description Adjust x and y position
if (!global.timeFrozen)
{
	if (xspeed != 0)
	{
		if (xPos < sprite_width)
		{
			xPos += xspeed;
		}
		else
		{
			xPos = 0;
		}
	}
}
drawX = (floor(global.viewX * (1 - parallaxX)) + xPos);
if (!global.timeFrozen)
{
	if (yspeed != 0)
	{
		if (yPos < sprite_height)
		{
			yPos += yspeed;
		}
		else
		{
			yPos = 0;
		}
	}
}
drawY = (floor(global.viewY * (1 - parallaxY)) + yPos);