/// @description Ryu and Irene move out
layer_sequence_destroy(currentSequence);
with (objTextbox)
{
	instance_destroy(id);
}
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuIreneMoveOut);