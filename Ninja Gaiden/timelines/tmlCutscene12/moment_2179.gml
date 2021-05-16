/// @description Clear sequence
layer_sequence_destroy(currentSequence);
backgrounds_set_visible(false, 0, 1, 2, 3, 4);
backgrounds_set_visible(true, 5);
kill_textboxes();

if (!global.soundtrackOption)
{
	music_play(bgmCutscene9);
}
else
{
	music_play(bgmCutscene9PCE);
}