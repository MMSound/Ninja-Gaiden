/// @description Move
round_velocity();

if (!move_platform_x(xspeed))
{
	xspeed = -xspeed;
	xspeedSub = 0;
}