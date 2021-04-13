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
	global.musicID[bgmAct2Scene2] = [bgmAct2Scene2, 70.408, 00.000];
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
	global.musicID[bgmAct6Scene3] = [bgmAct6Scene3, 76.405, 00.000];
	global.musicID[bgmBossFight] = [bgmBossFight, 35.472, 01.870];
	global.musicID[bgmMalthFight] = [bgmMalthFight, 27.345, 00.664];
	global.musicID[bgmMaskedDevilFight] = [bgmMaskedDevilFight, 26.159, 14.959];
	global.musicID[bgmJaquioBattle] = [bgmJaquioBattle, 64.273, 18.665];
	global.musicID[bgmJashinFight] = [bgmJashinFight, 26.070, 03.066];
	global.musicID[bgmDeath] = [bgmDeath, 03.052, -1];
	global.musicID[bgmOptionsMenu] = [bgmOptionsMenu, 34.136, 0];
	global.musicID[bgmBossIntro] = [bgmBossIntro, 0.502, -1];
	global.musicID[bgmCutscene1] = [bgmCutscene1, 25.416, -1];
	global.musicID[bgmCutsceneJingle1] = [bgmCutsceneJingle1, 03.386, -1];
	global.musicID[bgmCutscene2] = [bgmCutscene2, 25.603, 21.338];
	
	global.musicID[bgmAct1Scene1PCE] = [bgmAct1Scene1PCE, 40.005, 02.668];
	global.musicID[bgmAct2Scene1PCE] = [bgmAct2Scene1PCE, 34.670, 02.665];
	global.musicID[bgmAct2Scene2PCE] = [bgmAct2Scene2PCE, 53.339, 05.333];
	global.musicID[bgmAct3Scene1PCE] = [bgmAct3Scene1PCE, 32.004, 00.000];
	global.musicID[bgmAct3Scene2PCE] = [bgmAct3Scene2PCE, 48.005, 12.797];
	global.musicID[bgmAct4Scene2PCE] = [bgmAct4Scene2PCE, 51.206, 00.000];
	global.musicID[bgmAct4Scene3PCE] = [bgmAct4Scene3PCE, 33.607, 07.471];
	global.musicID[bgmAct5Scene1PCE] = [bgmAct5Scene1PCE, 37.337, 05.333];
	global.musicID[bgmAct5Scene2PCE] = [bgmAct5Scene2PCE, 55.996, 03.728];
	global.musicID[bgmAct5Scene3PCE] = [bgmAct5Scene3PCE, 58.939, 15.599];
	global.musicID[bgmAct6Scene1PCE] = [bgmAct6Scene1PCE, 34.136, 17.069];
	global.musicID[bgmAct6Scene2PCE] = [bgmAct6Scene2PCE, 88.008, 19.203];
	global.musicID[bgmBossFightPCE] = [bgmBossFightPCE, 15.651, 02.852];
	global.musicID[bgmCutscene1PCE] = [bgmCutscene1PCE, 22.001, -1];
	global.musicID[bgmCutscene2PCE] = [bgmCutscene2PCE, 33.605, 04.787];
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
		audio_sound_gain(global.musicSound, ((global.musicVolume * 0.75) * global.musicFadeVolume), 0);
		
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

/// @description set the fade volume so we can do fading effects
function music_set_fade(_level)
{
	global.musicFadeVolume = _level;
	audio_sound_gain(global.musicSound, ((global.musicVolume * 0.75) * global.musicFadeVolume), 0);
}

//this is some of the worst programming ever designed

/// @description change between the nes and pce soundtracks
function music_change_soundtrack()
{
	if (music_get_alt(global.currentMusic))
	{
		music_stop();
		global.queuedSong = music_get_alt(global.currentMusic);
	}
}

/// @description get if an alt version of the song exists
function music_get_alt(_song)
{
	switch (_song)
	{
		case bgmAct1Scene1:
			return bgmAct1Scene1PCE;
			break;
		case bgmAct1Scene1PCE:
			return bgmAct1Scene1;
			break;
			
		case bgmAct2Scene1:
			return bgmAct2Scene1PCE;
			break;
		case bgmAct2Scene1PCE:
			return bgmAct2Scene1;
			break;
			
		case bgmAct2Scene2:
			return bgmAct2Scene2PCE;
			break;
		case bgmAct2Scene2PCE:
			return bgmAct2Scene2;
			break;

		case bgmAct3Scene1:
			return bgmAct3Scene1PCE;
			break;
		case bgmAct3Scene1PCE:
			return bgmAct3Scene1;
			break;

		case bgmAct3Scene2:
			return bgmAct3Scene2PCE;
			break;
		case bgmAct3Scene2PCE:
			return bgmAct3Scene2;
			break;
			
		case bgmAct4Scene2:
			return bgmAct4Scene2PCE;
			break;
		case bgmAct4Scene2PCE:
			return bgmAct4Scene2;
			break;
			
		case bgmAct4Scene3:
			return bgmAct4Scene3PCE;
			break;
		case bgmAct4Scene3PCE:
			return bgmAct4Scene3;
			break;
			
		case bgmAct5Scene1:
			return bgmAct5Scene1PCE;
			break;
		case bgmAct5Scene1PCE:
			return bgmAct5Scene1;
			break;
			
		case bgmAct5Scene2:
			return bgmAct5Scene2PCE;
			break;
		case bgmAct5Scene2PCE:
			return bgmAct5Scene2;
			break;
			
		case bgmAct5Scene3:
			return bgmAct5Scene3PCE;
			break;
		case bgmAct5Scene3PCE:
			return bgmAct5Scene3;
			break;

		case bgmAct6Scene1:
			return bgmAct6Scene1PCE;
			break;
		case bgmAct6Scene1PCE:
			return bgmAct6Scene1;
			break;

		case bgmAct6Scene2:
			return bgmAct6Scene2PCE;
			break;
		case bgmAct6Scene2PCE:
			return bgmAct6Scene2;
			break;
			
		case bgmBossFight:
			return bgmBossFightPCE;
			break;
		case bgmBossFightPCE:
			return bgmBossFight;
			break;

		default:
			return false;
			break;
	}
}