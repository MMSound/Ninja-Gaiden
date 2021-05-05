/// @description Irene pensivo
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqIrenePensive);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene9Part2);
}
else
{
	music_play(bgmCutscene9Part2PCE);
}