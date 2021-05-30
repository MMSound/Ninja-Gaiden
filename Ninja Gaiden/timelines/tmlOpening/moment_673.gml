/// @description Gray ninja running
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqGrayNinjaFaceRun);
play_sfx(sfxNinjaRun);
backgrounds_set_visible(true, 3, 14, 15);
backgrounds_set_xspeed(4, 14, 8, 15);