/// @description Move
round_velocity();

if (!move_platform_x(xspeed))
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