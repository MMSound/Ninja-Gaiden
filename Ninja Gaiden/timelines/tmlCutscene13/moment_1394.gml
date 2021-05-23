/// @description Jaquio shoots Ken
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqJaquioShoot);
backgrounds_set_visible(true, 8);
backgrounds_set_visible(false, 0, 1, 2, 3, 4, 5, 6, 7, 9);
play_sfx(sfxJaquioCharge);