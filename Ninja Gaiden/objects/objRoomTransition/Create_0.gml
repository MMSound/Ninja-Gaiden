/// @description Variables
roomTo = -1;
timer = 0;
phase = 0;

if (global.currentLives == 0 && global.deathRespawn)
{
	global.screenPalette = sprDeathFadePalette;
}