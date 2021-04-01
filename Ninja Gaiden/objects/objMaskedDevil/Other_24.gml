/// @description Custom variables
canBeHit = false;
contactDamage = 4;

moveSpeed = 1.25;

phase = 0;
phaseTimer = 0;

bounceCount = 0;

//we wanna fire an aimed bullet
function fire_aimed_bullet(_yOffset)
{
	_yOffset = is_undefined(_yOffset) ? -16 : _yOffset;
	if (instance_exists(objPlayer))
	{
		var _bullet = instance_create_depth((x + 16), (y - 32), depth, objGenericBullet);
	    var _dir = point_direction((x + 16), (y - 32), objPlayer.x, (objPlayer.y + _yOffset));
	    _bullet.xspeed = lengthdir_x(5, _dir);
	    _bullet.yspeed = lengthdir_y(5, _dir);
		_bullet.contactDamage = 2;
	}	
}

//we wanna fire an aimed bullet spread
function fire_aimed_bullet_spread()
{
	fire_aimed_bullet(-48);
	fire_aimed_bullet();
	fire_aimed_bullet(32);
}