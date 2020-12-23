/// @description Custom variables
contactDamage = 2;
healthPoints = 1;

hasCollision = true;
hasGravity = true;

grav = 0.16;

timer = 0;

sprite_index = sprRyuRun;
imgSpd = (1 / 2);

xspeed = 2;
yspeed = 0;

function jump_towards_player()
{
	if (instance_exists(objPlayer))
	{
		var _playerDir = sign(objPlayer.x - x);
		if (_playerDir == 0)
		{
			_playerDir = 1;
		}
		yspeed = -4.16;
		image_xscale = _playerDir;
		move_x(image_xscale * 2);
		timer = 0;
	}
	else
	{
		exit;
	}
}