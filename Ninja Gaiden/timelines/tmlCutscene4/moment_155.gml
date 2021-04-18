/// @description Ryu
backgrounds_set_visible(true, 2, 3);
backgrounds_set_visible(false, 0, 1, 4, 5, 6, 7);
if (!global.soundtrackOption)
{
	music_play(bgmCutscene4);
}
else
{
	music_play(bgmCutscene4PCE);
}