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
		
		/*if (place_meeting(x, y, global.currentSection))
		{
			play_sfx(sfxWindBlow);
		}*/
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
		_parallax.xspeed = (moveDir * 1.5);
	}
	
	timer++;
}