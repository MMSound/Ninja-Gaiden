/// @description Init
if (!global.soundtrackOption)
{
	music_play(bgmCutscene2);
}
else
{
	music_play(bgmCutscene2PCE);
}
backgrounds_set_visible(true, 0, 5);
backgrounds_set_visible(false, 1, 2, 3, 4);