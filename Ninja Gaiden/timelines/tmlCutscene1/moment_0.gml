/// @description Init
if (!global.soundtrackOption)
{
	music_play(bgmCutscene1);
}
else
{
	music_play(bgmCutscene1PCE);
}
backgrounds_set_visible(true, 0);
backgrounds_set_visible(false, 1, 2);

nextRoom = rmAct2Scene1;