//this script contains functions to play sounds

/// @description play sfx accounting for gain
function play_sfx(_sound, _loop, _channel)
{
	if (is_undefined(_loop))
	{
		_loop = false;
	}
	if (is_undefined(_channel))
	{
		_channel = 10;
	}
	
	//i had this little bit of optimization come to me in a dream
	if (global.sfxVolume == 0)
	{
		exit;
	}
	
	var _sfx = audio_play_sound(_sound, _channel, _loop);
	audio_sound_gain(_sfx, global.sfxVolume, 0);
	
	//thanks cresh
	if (global.sfxSubtitles)
	{
		var _subtitle = instance_create_depth(0, 0, -1000, objSubtitle);
			_subtitle.myText = global.subtitle[_sound];
	}
}

/// @description this script contains the music data
function initialize_music()
{
	global.musicPlaying = false;
	global.musicSound = -1;
	global.musicLength = 0;
	global.musicLoop = 0;
	global.currentMusic = noone;
	
	//music table
	global.musicID[bgmAct1Scene1] = [bgmAct1Scene1, 76.809, 44.803];
	global.musicID[bgmAct2Scene1] = [bgmAct2Scene1, 43.205, 04.787];
	global.musicID[bgmAct2Scene2] = [bgmAct2Scene2, 70.408, 70.408];
	global.musicID[bgmAct3Scene1] = [bgmAct3Scene1, 55.987, 02.663];
	global.musicID[bgmAct3Scene2] = [bgmAct3Scene2, 68.007, 04.001];
	global.musicID[bgmAct4Scene1] = [bgmAct4Scene1, 51.206, 06.399];
	global.musicID[bgmAct4Scene2] = [bgmAct4Scene2, 43.206, 01.593];
	global.musicID[bgmAct4Scene3] = [bgmAct4Scene3, 53.339, 36.265];
	global.musicID[bgmAct5Scene1] = [bgmAct5Scene1, 50.673, 18.658];
	global.musicID[bgmAct5Scene2] = [bgmAct5Scene2, 61.606, 16.801];
	global.musicID[bgmAct5Scene3] = [bgmAct5Scene3, 93.576, 56.250];
	global.musicID[bgmAct6Scene1] = [bgmAct6Scene1, 34.136, 17.069];
	global.musicID[bgmAct6Scene2] = [bgmAct6Scene2, 88.008, 19.203];
	global.musicID[bgmDeath] = [bgmDeath, 03.052, -1];
	global.musicID[bgmOptionsMenu] = [bgmOptionsMenu, 34.136, 0];
}

/// @description shoutouts to bucket
function music_play(_song)
{
	music_stop();
	if (is_undefined(_song))
	{
		_song = -1;
	}
	
	//reset all the shit
	global.musicSound = noone;
	global.musicLength = 0;
	global.musicLoop = 0;
	global.currentMusic = _song;
	
	//play new song
	if (_song != -1)
	{
		var _params = global.musicID[_song];
		global.musicSound = audio_play_sound(_params[0], 0, false);
		global.musicLength = _params[1];
		global.musicLoop = _params[2];
		audio_sound_gain(global.musicSound, (global.musicVolume * 0.75), 0);
		
		global.musicPlaying = true;
	}
}

/// @description the same, with less feeling
function music_stop()
{
	global.musicPlaying = false;
	
	//stop music
	if (global.musicSound != noone)
	{
		audio_stop_sound(global.musicSound);
		audio_sound_set_track_position(global.musicSound, 0);
	}
}

/// @description seriously i would have literally no idea what to do if not for bucket
function music_loop()
{
	var _position = (audio_sound_get_track_position(global.musicSound) - (global.musicLength - global.musicLoop));
	
	music_play(global.currentMusic);
	audio_sound_set_track_position(global.musicSound, _position);
}