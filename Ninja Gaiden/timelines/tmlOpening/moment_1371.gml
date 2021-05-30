/// @description Clear sequence
layer_sequence_destroy(currentSequence);
backgrounds_set_visible(false, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15);
if (instance_exists(objWhiteSlash))
{
	instance_destroy(objWhiteSlash);
}