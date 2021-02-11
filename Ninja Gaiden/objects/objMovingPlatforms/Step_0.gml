/// @description Move
round_velocity();

if (!move_platform_topsolid_x(xspeed))
{
	xspeed *= -1;
	xspeedSub = 0;
}
if (!move_platform_topsolid_y(yspeed))
{
	yspeed *= -1;
	yspeedSub = 0;
}