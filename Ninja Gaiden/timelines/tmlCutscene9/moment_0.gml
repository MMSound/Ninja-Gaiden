/// @description Init
backgrounds_set_visible(true, 2);
backgrounds_set_visible(false, 0, 1);
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqJaquioTalk1);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene9);
}
else
{
	music_play(bgmCutscene9PCE);
}

nextRoom = rmAct5Scene1;