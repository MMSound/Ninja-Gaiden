/// @description Init
backgrounds_set_visible(false, 0, 1, 2, 3, 10, 14, 15, 16);
backgrounds_set_xspeed(0.25, 6, 0.5, 7, 0.75, 8, 1, 9);
drawBlackBars = false;
nextRoom = rmTitleScreen;

if (!global.soundtrackOption)
{
	music_play(bgmOpeningPart1);
}
else
{
	music_play(bgmOpeningPart1PCE);
}

/*
0 = ryu angry
1 = ryu letter (don't use)
2 = front grass for falling scene
3 = sky for falling scene
4 = ken approach
5 = gray ninja approach
6-9 = grass
10 = back grass for running scenes
11 = moon
12 = purple
13 = black
14 = wind lines back
15 = wind lines front
16 = sword
*/