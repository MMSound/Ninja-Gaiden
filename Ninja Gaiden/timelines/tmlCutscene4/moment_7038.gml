/// @description Jump SFX
play_sfx(sfxJump);
if (audio_is_playing(sfxNinjaRun))
{
	audio_stop_sound(sfxNinjaRun);
}