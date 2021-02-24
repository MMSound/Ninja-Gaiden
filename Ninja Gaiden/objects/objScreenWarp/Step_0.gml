/// @description Warp stuff
if (place_meeting(x, y, objPlayer))
{	
	with (prtEntity)
	{
		if (inside_view())
		{
			x += (other.screensToWarp * global.viewW);
		}
	}
	
	//delete instances if necessary
	if (array_length(instancesToDestroy) > 0)
	{
		for (var i = 0; i < array_length(instancesToDestroy); i++)
		{
			instance_destroy(instancesToDestroy[i]);
		}
	}
	
	//flash the spots
	if (instance_exists(objAct6Scene2Warp))
	{
		with (objAct6Scene2Warp)
		{
			event_user(0);
		}
	}
	
	play_sfx(sfxScoreCountdown, false);
}