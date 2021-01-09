/// @description Move
if (collision_rectangle(bbox_left, (bbox_top - 1), bbox_right, bbox_top, objPlayer, false, true)) //detect player
{
	if (timer > 3) //allow a little downtime so you can jump off without it moving
	{
		var _moveSelf = false;
		var _moveOther = false;
		if (y < bottomBound) //can move self?
		{
			_moveSelf = true;
		}
		if (otherPillar.y >= otherPillar.topBound) //can move other pillar?
		{
			if (!collision_rectangle(otherPillar.bbox_left, (otherPillar.bbox_top - 1), otherPillar.bbox_right, otherPillar.bbox_top, prtEnemy, false, true))
			{
				_moveOther = true;
			}
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
	timer++;
}
else
{
	timer = 0;
}

y = clamp(y, topBound, bottomBound);

if (instance_exists(objPlayer))
{
	depth = (objPlayer.depth + 5);
}

//shunting out enemies if necessary
if (collision_rectangle((bbox_left - 2), bbox_top, (bbox_right + 2), bbox_bottom, prtEnemy, false, true))
{
	var _enemy = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, prtEnemy, false, true);
	if (instance_exists(_enemy))
	{
		_enemy.x += (2 * _enemy.image_xscale);
	}
}