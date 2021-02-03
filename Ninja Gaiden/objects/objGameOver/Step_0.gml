/// @description Controlling
event_inherited();

//do the wave
if (!isDormant)
{
	if (wavePhase < 1)
	{
		wavePhase += 0.01;
	}
	else
	{
		wavePhase = 0;
	}
}