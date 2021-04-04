/// @description Variables
xspeed = 0;

hasCollision = false;
hasGravity = false;

imgSpd = (1 / 2);

contactDamage = 2;

//face player
if (instance_exists(objPlayer))
{
	var _playerDir = sign(objPlayer.x - x);
	if (_playerDir != 0)
	{
		image_xscale = _playerDir;
	}
}