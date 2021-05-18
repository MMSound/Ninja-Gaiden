/// @description Init
backgrounds_set_visible(true, 3, 4, 5);
backgrounds_set_visible(false, 0, 1, 2, 6, 7, 8, 9);
if (!global.soundtrackOption)
{
	music_play(bgmCutscene3);
}
else
{
	music_play(bgmCutscene3PCE);
}
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuRunLeft);

nextRoom = rmAct4Scene1;

/*
myBackgrounds[0] = "Background_0"; //ryu far portrait
myBackgrounds[1] = "Background_1"; //ryu looking back
myBackgrounds[2] = "Background_2"; //ryu neutral
myBackgrounds[3] = "Background_3"; //running bg front
myBackgrounds[4] = "Background_4"; //running bg back
myBackgrounds[5] = "Background_5"; //running bg
myBackgrounds[6] = "Background_6"; //ryu holding walter
myBackgrounds[7] = "Background_7"; //three fellas
myBackgrounds[8] = "Background_8"; //blue
myBackgrounds[9] = "Background_9"; //black
*/