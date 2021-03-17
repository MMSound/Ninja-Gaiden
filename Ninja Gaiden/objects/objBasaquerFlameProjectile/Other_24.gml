/// @description Custom variables
event_inherited();

hasCollision = true;
imgSpd = 1;
yspeed = 4;

function make_wave(_x, _xscale)
{
	var _wave = instance_create_depth(_x, y, depth, objBasaquerFireWave);
		_wave.image_xscale = _xscale;
}