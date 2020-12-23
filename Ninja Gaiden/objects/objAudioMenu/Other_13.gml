/// @description Custom right input
switch (currentOption)
{
	case 0: //music volume
		if (global.musicVolume < 1.0)
		{
			global.musicVolume += 0.1;
		}
		else
		{
			global.musicVolume = 0;
		}
		break;
	case 1: //sound effect volume
		if (global.sfxVolume < 1.0)
		{
			global.sfxVolume += 0.1;
		}
		else
		{
			global.sfxVolume = 0;
		}
		break;
}
play_sfx(sfxShuriken);