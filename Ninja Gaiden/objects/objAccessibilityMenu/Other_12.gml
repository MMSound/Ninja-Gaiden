/// @description Custom left input
switch (currentOption)
{
	case 0:	
		if (global.backgroundBrightness < 6)
		{
			global.backgroundBrightness++;
		}
		else
		{
			global.backgroundBrightness = 0;
		}
		play_sfx(sfxShuriken);
		break;
	case 1:
		global.sfxSubtitles = !global.sfxSubtitles;
		play_sfx(sfxShuriken);
		break;
}