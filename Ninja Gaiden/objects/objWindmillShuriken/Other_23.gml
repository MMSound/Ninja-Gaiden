/// @description Increase combo
if (global.bossPhase != 2)
{
	if (combo > 0)
	{
		global.gameScore += 25;
		score_text(x, (y - 32), 25);
	}
	combo++;
}