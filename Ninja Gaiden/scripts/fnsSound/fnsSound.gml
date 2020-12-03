//this script contains functions to play sounds

/// @description play sfx accounting for gain
function play_sfx(_sound, _loop)
{
	if (is_undefined(_loop))
	{
		_loop = false;
	}
	var _sfx = audio_play_sound(_sound, 10, _loop);
	audio_sound_gain(_sfx, global.sfxVolume, 0);
	
	//thanks cresh
	if (global.sfxSubtitles)
	{
		var _subtitle = instance_create_depth(0, 0, -1000, objSubtitle);
			_subtitle.myText = global.subtitle[_sound];
	}
}