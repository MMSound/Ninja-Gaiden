/// @description Custom variables
hasCollision = false;
hasGravity = false;
healthPoints = 16;

contactDamage = 4;

phase = 0;
phaseTimer = 0;
phaseTime = 100;

iFrameTime = 30;
iFrameTimer = 0;

animTimer = 0;

mySickle = noone;
jumpTimer = 0;
setGround = true;
screenPos = 0;
isThrow = false;
attackCount = 0;
shieldTotal = 14;

waveLength = 16;
amplitude = 0;
ampDir = 1;
wavePhase = 0;
phaseMod = 0;

//this is the warping around part
function init_new_phase(_x, _y, _playerX, _playerY, _xScale, _playerXScale)
{
	if (instance_exists(objPlayer))
	{
		x = (global.viewX + _x);
		y = (global.viewY + (_y + 8));
		image_xscale = is_undefined(_xScale) ? 1.00 : _xScale;
		objPlayer.x = (global.viewX + _playerX);
		objPlayer.y = (global.viewY + (_playerY + 8));
		objPlayer.image_xscale = is_undefined(_playerXScale) ? 1.00 : _playerXScale;
		if (!instance_exists(objPixelation))
		{
			instance_create_depth(0, 0, 0, objPixelation);
		}
		xspeed = 0;
		yspeed = 0;
		global.levelTime = choose(5, 7, 666, 13, 27, 19, 103, 58, 43, 147, 83, 69, 193, 167);
		play_sfx(sfxJashinHeadWarp);
		if (instance_exists(objJashinWaveBG))
		{
			with (objJashinWaveBG)
			{
				waveLength = irandom_range(2, 64);
				amplitude = irandom_range(16, 64);
			}
		}
	}
}

//the malth functions
function lightning_pillar_create(_x, _y, _height)
{
	for (var i = 0; i < _height; i++)
	{
		var _shot = instance_create_depth(_x, (_y - (i * 16)), depth, objGenericBullet);
			_shot.contactDamage = 2;
			_shot.xspeed = 3;
			_shot.canBeHit = false;
			_shot.sprite_index = sprMalthLightningBallSmall;
			_shot.imgSpd = 1;
	}
	play_sfx(sfxMalthZapSmall);
}

function summon_lightning()
{
	instance_create_depth(x, (y - 48), depth, objBloodyMalthLightningSummon);
	play_sfx(sfxMalthSummon);
	colorIndex = 3;
}

//the jaquio function
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

//wavy
function wave_update(_phase)
{
	if (is_undefined(_phase))
	{
		_phase = 0.1;
	}
	wavePhase += _phase;
	if (wavePhase > 1)
	{
		wavePhase = 0;
	}	
}