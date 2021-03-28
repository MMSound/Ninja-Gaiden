/// @description Custom left input
switch (currentOption)
{
	case 0: //music volume
		if (global.musicVolume > 0)
		{
			global.musicVolume -= 0.1;
		}
		else
		{
			global.musicVolume = 1.0;
		}
		break;
	case 1: //sound effect volume
		if (global.sfxVolume > 0)
		{
			global.sfxVolume -= 0.1;
		}
		else
		{
			global.sfxVolume = 1.0;
		}
		break;
	case 2: //soundtrack
		global.soundtrackOption = !global.soundtrackOption;
		music_change_soundtrack();
		break;
}
play_sfx(sfxShuriken);