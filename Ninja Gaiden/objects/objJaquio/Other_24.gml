/// @description Custom variables
event_inherited();

contactDamage = 3;

hasGravity = false;
hasCollision = false;

phase = 0;
phaseTimer = 0;

imgSpd = 0;

moveDir = -1;
xspeedReal = 2;
bounceCount = 0;
targetY = (ystart + 8);
drawFire = false;
warpCount = 0;

waveLength = 64;
amplitude = 0;
ampDir = 1;
wavePhase = 0;

depth = 5;

nextRoom = rmAct6Boss3;

//fire fireballs
function fire_eight_way_spread(_x, _y, _speed)
{
	if (is_undefined(_speed))
	{
		_speed = 2;
	}
	
	var _dirArray = [];
	_dirArray[0][0] = 0; //xspeed
	_dirArray[1][0] = _speed;
	_dirArray[2][0] = _speed;
	_dirArray[3][0] = _speed;
	_dirArray[4][0] = 0;
	_dirArray[5][0] = -_speed;
	_dirArray[6][0] = -_speed;
	_dirArray[7][0] = -_speed;
	
	_dirArray[0][1] = -_speed; //yspeed
	_dirArray[1][1] = -_speed;
	_dirArray[2][1] = 0;
	_dirArray[3][1] = _speed;
	_dirArray[4][1] = _speed;
	_dirArray[5][1] = _speed;
	_dirArray[6][1] = 0;
	_dirArray[7][1] = -_speed;
	
	for (var i = 0; i < 8; i++)
	{
		var _fire = instance_create_depth(_x, _y, (depth - 1), objGenericBullet);
			_fire.xspeed = _dirArray[i][0];
			_fire.yspeed = _dirArray[i][1];
			_fire.sprite_index = sprJaquioFireball;
			_fire.contactDamage = 2;
	}
}