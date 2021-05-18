/// @description Init
drawBlackBars = false;
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqCutscene7);

music_play(sfxHelicopter);
if (global.sfxSubtitles)
{
	var _subtitle = instance_create_depth(0, 0, -1000, objSubtitle);
		_subtitle.myText = global.subtitle[sfxHelicopter];
}

nextRoom = rmAct4Scene1;