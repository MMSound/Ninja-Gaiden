/// @description Init
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuRunRight);
if (!global.soundtrackOption)
{
	music_play(bgmCutscene3);
}
else
{
	music_play(bgmCutscene3PCE);
}