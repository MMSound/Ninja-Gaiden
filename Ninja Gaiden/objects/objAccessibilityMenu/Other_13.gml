/// @description Custom right input
switch (currentOption)
{
	case 0:	
		if (global.backgroundBrightness > 0)
		{
			global.backgroundBrightness--;
		}
		else
		{
			global.backgroundBrightness = 6;
		}
		play_sfx(sfxShuriken);
		break;
	case 1:
		global.sfxSubtitles = !global.sfxSubtitles;
		play_sfx(sfxShuriken);
		break;
}