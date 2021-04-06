/// @description Custom variables
hasGravity = false;
hasCollision = false;
healthPoints = 16;
contactDamage = 4;

imgSpd = 0;
image_index = 5;

phase = 0;
phaseTimer = 0;

iFrameTimer = 0;
iFrameTime = 20;

hasProjectiled = false;
fireCount = 0;
fireCountIncreased = false;

//fire wave
function make_wave(_x, _y, _xscale)
{
	var _wave = instance_create_depth(_x, _y, depth, objBasaquerFireWave);
		_wave.image_xscale = _xscale;
		_wave.orderMax = 2;
}