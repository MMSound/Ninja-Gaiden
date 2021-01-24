/// @description Variables
roomTo = -1;
timer = 0;
phase = 0;

depth = -10000;

if (global.currentLives == 0 && global.deathRespawn)
{
	global.screenPalette = sprDeathFadePalette;
}

drawAlpha = 0.0;