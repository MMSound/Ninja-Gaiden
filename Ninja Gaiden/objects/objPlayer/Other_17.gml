/// @description Getting killed
isDead = true;
global.playerHealth = healthPoints;
if (!playedDeathSFX)
{
	play_sfx(sfxPlayerHit);
	playedDeathSFX = true;
}
yspeed = -2;
xspeed = -image_xscale;