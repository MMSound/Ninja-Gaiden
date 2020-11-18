/// @description Getting killed
isDead = true;
if (!playedDeathSFX)
{
	play_sfx(sfxPlayerHit);
	playedDeathSFX = true;
}