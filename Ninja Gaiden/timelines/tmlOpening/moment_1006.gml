/// @description Red ninja jump
layer_sequence_destroy(currentSequence);
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRedNinjaJump);
play_sfx(sfxJump);
backgrounds_set_xspeed(-8, 2, -5, 10);