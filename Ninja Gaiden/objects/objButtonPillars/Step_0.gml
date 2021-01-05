/// @description Move
if (collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, bbox_top, objPlayer, false, true)) //detect player
{
	var _moveSelf = false;
	var _moveOther = false;
	if (y < bottomBound) //can move self?
	{
		_moveSelf = true;
	}
	if (otherPillar.y >= otherPillar.topBound) //can move other pillar?
	{
		_moveOther = true;
	}
	if (_moveSelf && _moveOther) //yeah we good
	{
		move_platform_y(1);
		with (otherPillar)
		{
			move_platform_y(-1);
		}
	}
}
y = clamp(y, topBound, bottomBound);