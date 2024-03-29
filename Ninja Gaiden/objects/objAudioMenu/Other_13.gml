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
		if (global.musicPlaying)
		{
			audio_sound_gain(global.musicSound, ((global.musicVolume * 0.75) * global.musicFadeVolume), 0);
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
	case 2: //soundtrack
		if (global.beatenGame)
		{
			global.soundtrackOption = !global.soundtrackOption;
			music_change_soundtrack();
		}
		break;
}
play_sfx(sfxShuriken);