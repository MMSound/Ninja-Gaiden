set_act(6, 1);
if (!global.soundtrackOption)
{
	music_play(bgmAct6Scene1);
}
else
{
	music_play(bgmAct6Scene1PCE);
}
with (objLantern)
{
	itemDrop = SMALL_NINPO;
}