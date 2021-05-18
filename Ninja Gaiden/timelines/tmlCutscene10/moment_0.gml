/// @description Init
global.viewX = 0;
global.viewY = 0;
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqMalthAppear);
backgrounds_set_visible(true, 2);
backgrounds_set_visible(false, 0, 1);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene10);
}
else
{
	music_play(bgmCutscene10PCE);
}

nextRoom = rmAct5Segue;