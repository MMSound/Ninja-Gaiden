/// @description Adjust x and y position
if (global.pceParallax)
{
	parallaxX = 0;
	parallaxY = 0;
}
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
var _drawX = (floor(global.viewX * (1 - parallaxX)) + xPos);
drawX = round_to_nearest(_drawX, (8 * global.pceParallax));
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
var _drawY = (floor(global.viewY * (1 - parallaxY)) + yPos);
drawY = round_to_nearest(_drawY, (8 * global.pceParallax));