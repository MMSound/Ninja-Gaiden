/// @description Camera adjustment and music
if (instance_exists(global.cameraFocusObject))
{
	camera_set_position((global.cameraFocusObject.x - global.cameraOffsetX), (global.cameraFocusObject.y - global.cameraOffsetY));
}

//adjust parallax
if (instance_exists(objParallax))
{
	if (!game_paused())
	{
		with (objParallax)
		{
			event_user(0);
		}
	}
}

//music
if (global.musicPlaying) 
{
	var _position;
	_position = audio_sound_get_track_position(global.musicSound);

	if (_position >= (global.musicLength - 0.02) || !audio_is_playing(global.musicSound)) 
	{
		if (global.musicLoop != -1)
		{
			music_loop();
		}
		else
		{
			music_stop();
		}
	}
}