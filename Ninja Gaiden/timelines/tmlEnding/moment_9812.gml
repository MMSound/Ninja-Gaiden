/// @description Irene smile
backgrounds_set_visible(true, 7);
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuIreneTalk);

if (!global.soundtrackOption)
{
	music_play(bgmEndingPart3);
}
else
{
	music_play(bgmEndingPart3PCE);
}