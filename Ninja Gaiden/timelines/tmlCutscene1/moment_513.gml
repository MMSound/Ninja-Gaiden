/// @description Ryu and Irene move out
layer_sequence_destroy(currentSequence);
kill_textboxes();
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuIreneMoveOut);