/// @description Getting hit
canBeHit = false;
isHit = true;
if (!isKnockback)
{
	play_sfx(sfxPlayerHit);
}
isKnockback = true;
if (!isWallClimb)
{
	yspeed = -2;
	xspeed = -image_xscale;
	global.canControl = false;
}