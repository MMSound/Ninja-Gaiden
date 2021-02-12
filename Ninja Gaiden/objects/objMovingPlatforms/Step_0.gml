/// @description Move
round_velocity();

if (!game_paused())
{
	var _move = moveOutsideView ? 1 : place_meeting(x, y, global.currentSection);
	if (!move_platform_topsolid_x(xspeed * _move))
	{
		xspeed *= -1;
		xspeedSub = 0;
	}
	if (!move_platform_topsolid_y(yspeed * _move))
	{
		yspeed *= -1;
		yspeedSub = 0;
	}
}