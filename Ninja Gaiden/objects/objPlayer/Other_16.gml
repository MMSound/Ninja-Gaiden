/// @description Getting hit
canBeHit = false;
isHit = true;
if (!isKnockback)
{
	play_sfx(sfxPlayerHit);
}
isKnockback = true;
if (!isWallClimb && !isHang)
{
	yspeed = -2;
	xspeed = -image_xscale;
	global.canControl = false;
	canWallClimb = false;
}