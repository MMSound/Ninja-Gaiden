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
	if (y < 240)
	{
		itemDrop = SMALL_NINPO;
	}
}