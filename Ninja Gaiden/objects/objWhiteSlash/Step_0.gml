/// @description Fade to white
if (!drawWhite)
{
	if (global.screenColorIndex < 7)
	{
		if (fadeTimer % fadeTime == 0)
		{
			global.screenColorIndex++;
		}
	}
	else
	{
		drawWhite = true;
		global.screenColorIndex = 0;
		global.screenPalette = sprScreenPalette;
		fadeTimer = 0;
	}
}
else //fade from white
{
	if (fadeTimer > 60)
	{
		if (fadeTimer % fadeTime == 0)
		{
			if (drawCol < 6)
			{
				drawCol++;
			}
		}
	}
}
fadeTimer++;