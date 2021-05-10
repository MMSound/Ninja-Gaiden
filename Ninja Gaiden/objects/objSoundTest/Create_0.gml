/// @description Variables
soundtest_initialize();

soundtrackType = 0;
soundtrackName[0] = "NES";
soundtrackName[1] = "PC ENGINE";

currentSong = 0;

global.uiColorIndex = 8;

progressBarX = (global.viewX + 160);
playButtonFrame = 0;

function draw_progress_bar(_x, _y, _length)
{
	draw_sprite_part(sprSoundTestProgressBar, 0, 0, 0, 1, 8, _x, _y);
	for (var i = 0; i < (floor(_length - 3) / 2); i++)
	{
		draw_sprite_part(sprSoundTestProgressBar, 0, 1, 0, 2, 8, (_x + ((i * 2) + 1)), _y);
	}
	draw_sprite_part(sprSoundTestProgressBar, 0, 3, 0, 2, 8, ((_x + _length) - 1), _y);
	
	//the middle of the bar
	if (global.musicPlaying)
	{
		var _trackProgressReal = (audio_sound_get_track_position(global.musicSound) / global.musicLength);
		var _trackProgress = (_length * _trackProgressReal);
		draw_sprite_ext(sprSoundTestProgressBarMiddle, 0, _x, _y, _trackProgress, 1.00, 0, c_white, 1.0);
	}
}