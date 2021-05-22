/// @description Init
backgrounds_set_visible(true, 0);
backgrounds_set_visible(false, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene9Part2);
}
else
{
	music_play(bgmCutscene9Part2PCE);
}

nextRoom = rmAct6Segue2;

/*
0 = ken looking back
1 = ryu holding ken
2 = ryu badass 1
3 = ryu badass 2
4 = ryu badass 3
5 = speed lines 1
6 = speed lines 2
7 = speed lines bg
8 = purple
9 = black
10 = ninpo
*/