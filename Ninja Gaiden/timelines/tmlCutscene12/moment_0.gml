/// @description Init
global.viewX = 0;
global.viewY = 0;
backgrounds_set_visible(false, 0, 1, 2, 3, 4);
backgrounds_set_visible(true, 5);
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuTurnedBackSlide);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene9Part2);
}
else
{
	music_play(bgmCutscene9Part2PCE);
}

nextRoom = rmAct6Segue1;

/*
0 = ryu look back
1 = ryu angry
2 = ryu surprised
3 = gradient
4 = grass
5 = black
*/