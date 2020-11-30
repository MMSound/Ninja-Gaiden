/// @description Movement
if (instance_exists(objPlayer))
{	
	var _playerDir = sign(objPlayer.x - x);
	if (_playerDir != 0)
	{
		image_xscale = _playerDir;
	}
}

if (timer % 2 == 0)
{
	xspeed = choose(-1, 1);
	yspeed = choose(-1, 1);
}
timer++;