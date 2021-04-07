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
	case 2:
		global.upFireEnabled = !global.upFireEnabled;
		play_sfx(sfxShuriken);
		break;
	case 3:	
		if (global.cutsceneLanguage < 6)
		{
			global.cutsceneLanguage++;
		}
		else
		{
			global.cutsceneLanguage = 0;
		}
		play_sfx(sfxShuriken);
		break;
	case 4:
		global.livesOption = !global.livesOption;
		play_sfx(sfxShuriken);
		break;
	case 5:
		global.isShader = !global.isShader;
		play_sfx(sfxShuriken);
		break;
}