/// @description Getting hit
canBeHit = false;
isHit = true;
isKnockback = true;
if (!isWallClimb)
{
	yspeed = -2;
	xspeed = -image_xscale;
	global.canControl = false;
}