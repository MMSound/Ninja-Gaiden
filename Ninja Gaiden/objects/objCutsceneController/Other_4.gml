/// @description Start timeline
if (timeline_exists(myTimeline))
{
	timeline_index = myTimeline;
	if (!timeline_running)
	{
		timeline_running = true;
	}
}