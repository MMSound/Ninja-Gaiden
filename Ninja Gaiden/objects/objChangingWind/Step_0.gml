/// @description Changing direction
event_inherited();

var _parallax = inst_59CDF9F;
if (!game_paused())
{
	if (timer % 150 == 0)
	{
		moveDir += changeDir;
		if (moveDir == 1)
		{
			changeDir = -1;
		}
		else if (moveDir == -1)
		{
			changeDir = 1;
		}
		
		if (instance_exists(_parallax))
		{
			_parallax.yspeed = 4;
		}
	}
	else if ((timer + 30) % 150 == 0)
	{
		if (instance_exists(_parallax))
		{
			_parallax.yspeed = 2;
		}
	}
	
	if (instance_exists(_parallax))
	{
		if (_parallax.xspeed < (moveDir * 1.5))
		{
			_parallax.xspeed += 0.25;
		}
		else if (_parallax.xspeed > (moveDir * 1.5))
		{
			_parallax.xspeed -= 0.25;
		}
	}
	
	timer++;
}