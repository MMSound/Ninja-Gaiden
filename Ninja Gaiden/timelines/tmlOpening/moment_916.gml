/// @description Red ninja running
layer_sequence_destroy(currentSequence);
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRedNinjaRun);
if (audio_is_playing(sfxNinjaRun))
{
	audio_stop_sound(sfxNinjaRun);
}
play_sfx(sfxNinjaRun);
backgrounds_set_xspeed(-8, 2, -5, 10);