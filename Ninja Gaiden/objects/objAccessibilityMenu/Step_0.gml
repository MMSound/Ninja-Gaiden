/// @description Controlling
event_inherited();

if (!isDormant)
{
	if (wavePhase < 1)
	{
		wavePhase += 0.04;
	}
	else
	{
		wavePhase = 0;
	}
}