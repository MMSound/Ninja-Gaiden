/// @description Custom left input
switch (currentOption)
{
	case 0:	
		if (global.isShader)
		{
			if (global.backgroundBrightness < 6)
			{
				global.backgroundBrightness++;
			}
			else
			{
				global.backgroundBrightness = 0;
			}
			play_sfx(sfxShuriken);
		}
		break;
	case 1:
		global.sfxSubtitles = !global.sfxSubtitles;
		play_sfx(sfxShuriken);
		break;
	case 2:
		global.upFireEnabled = !global.upFireEnabled;
		play_sfx(sfxShuriken);
		break;
	case 3:
		if (global.cutsceneLanguage > 0)
		{
			global.cutsceneLanguage--;
			if (global.cutsceneLanguage == RUS)
			{
				global.cutsceneLanguage--;
			}
		}
		else
		{
			global.cutsceneLanguage = 6;
		}
		play_sfx(sfxShuriken);		
		break;
	case 4:
		global.livesOption = !global.livesOption;
		play_sfx(sfxShuriken);
		break;
}