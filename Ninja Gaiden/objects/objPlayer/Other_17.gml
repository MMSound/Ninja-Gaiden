/// @description Getting killed
isDead = true;
canBeHit = false;
if (!playedDeathSFX)
{
	play_sfx(sfxPlayerHit);
	playedDeathSFX = true;
}
yspeed = -2;
xspeed = -image_xscale;