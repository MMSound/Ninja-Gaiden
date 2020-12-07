/// @description Movement
if (instance_exists(objPlayer))
{
	//face player
	var _playerDir = sign(objPlayer.x - x);
	if (_playerDir != 0)
	{
		image_xscale = _playerDir;
	}
	
	//y movement
	if (y < (objPlayer.y - 16))
	{
		y++;
	}
	else if (y > (objPlayer.y - 16))
	{
		y--;
	}
	
	//x movement
	if (distance_to_object(objPlayer) > 96)
	{
		if (_playerDir == 1)
		{
			if (xspeed < 3)
			{
				xspeed += 0.25;
			}
		}
		else
		{
			if (xspeed > -3)
			{
				xspeed -= 0.25;
			}
		}
	}
	else
	{
		var _newSpeed = round_to_nearest(xspeed, 3);
		if (_newSpeed == 0)
		{
			_newSpeed = (image_xscale * 3);
		}
		xspeed = _newSpeed;
	}
}