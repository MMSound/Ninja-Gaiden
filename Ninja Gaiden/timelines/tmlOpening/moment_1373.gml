/// @description Ken died :(
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqKenFall);
backgrounds_set_visible(true, 2, 3);
backgrounds_set_xspeed(0, 2, 0, 3);
drawBlackBars = true;

if (!global.soundtrackOption)
{
	music_play(bgmOpeningPart2);
}