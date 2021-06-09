/// @description Init
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqSRLogo);
music_play(bgmStaffRoll);
drawBlackBars = false;
textbox_create("STAFF", (global.viewX + 180), (global.viewY + 128));
backgrounds_set_visible(false, 1);
nextRoom = -1;