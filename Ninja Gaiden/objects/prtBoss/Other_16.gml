/// @description Getting hit
if (iFrameTimer == 0)
{
	iFrameTimer = iFrameTime;
	canBeHit = false;
	play_sfx(sfxPlayerHit);
}