/// @description Gray ninja running
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqGrayNinjaRun);
play_sfx(sfxNinjaRun);
backgrounds_set_visible(true, 2, 3, 10);
backgrounds_set_xspeed(8, 2, 5, 10);