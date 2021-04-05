/// @description Control movement
xspeed += (0.25 * image_xscale);
if (instance_exists(objPlayer))
{
	var _playerDir = sign(objPlayer.y - y);
	if (_playerDir == 1)
	{
		if (y < objPlayer.y)
		{
			yspeed = instance_exists(objPlayer) ? ((objPlayer.y - y) / 32) : 1.5;
		}
	}
	else if (_playerDir == -1)
	{
		if (y > objPlayer.y)
		{
			yspeed = instance_exists(objPlayer) ? ((objPlayer.y - y) / 32) : 1.5;
		}		
	}
}

if (!inside_view(64))
{
	instance_destroy(id);
}