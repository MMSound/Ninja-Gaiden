/// @description Ryu shot
currentSequence = sequence_create_layer(global.viewX, global.viewY, seqRyuShoot);
backgrounds_set_visible(true, 0);
backgrounds_set_visible(false, 1, 2);
with (objTextbox)
{
	instance_destroy(id);
}