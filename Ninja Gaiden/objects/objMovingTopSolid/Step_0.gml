/// @description Move
round_velocity();

if (!move_platform_topsolid_x(xspeed))
{
	if (xspeed == 2)
	{
		xspeed = -2;
	}
	else
	{
		xspeed = 2;
	}
	xspeedSub = 0;
}
if (!move_platform_topsolid_y(yspeed))
{
	if (yspeed == 2)
	{
		yspeed = -2;
	}
	else
	{
		yspeed = 2;
	}
	yspeedSub = 0;
}