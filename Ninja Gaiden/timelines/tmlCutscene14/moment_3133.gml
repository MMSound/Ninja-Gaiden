/// @description Black screen
layer_sequence_destroy(currentSequence);
if (audio_is_playing(sfxStatuesCombine))
{
	audio_stop_sound(sfxStatuesCombine);
}