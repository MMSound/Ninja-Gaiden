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
}