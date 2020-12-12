/// @description Moving
if (!game_paused())
{
	y += 4;
	x += global.viewX + xspeed;
	
	//wrap
	if (y > (global.viewY + (global.viewH + 2)))
	{
		y = global.viewY;
	}
	
	if (x > (global.viewX + (global.viewW + 2)))
	{
		x = global.viewX;
	}
	else if (x < global.viewX)
	{
		x = (global.viewX + (global.viewW + 2));
	}
	
	timer++;
}