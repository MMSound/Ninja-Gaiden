/// @description Custom variables
hasCollision = false;
hasGravity = false;

contactDamage = 2;

thetaOffset = 0;
centerX = xstart;
centerY = ystart;
theta = thetaOffset;
radius = 0;
locus = objMaskedDevil;
moveSpeed = 2.5;
myCore = noone;

//basically the point of this is to make all of the shields have the same theta since one could be spawned
//at any given time
function fix_theta()
{
	var _shield = instance_find(objMaskedDevilShield, 0);
	if (_shield != noone)
	{
		theta = _shield.theta;
	}
}