/// @description Init
drawBlackBars = false;
backgrounds_set_xspeed(-0.25, 0, -0.15, 1, 0.1, 2, 0.2, 3, -0.75, 4, -0.05, 5, 0.3, 6);

if (!global.soundtrackOption)
{
	music_play(bgmCutscene8);
}
else
{
	music_play(bgmCutscene8PCE);
}

nextRoom = rmAct4Scene2;