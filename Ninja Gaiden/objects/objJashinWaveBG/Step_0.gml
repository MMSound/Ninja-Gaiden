/// @description Control values
if (!game_paused())
{
	if (phase < 1)
	{
		phase += 0.05;
	}
	else
	{
		phase = 0;
	}
}