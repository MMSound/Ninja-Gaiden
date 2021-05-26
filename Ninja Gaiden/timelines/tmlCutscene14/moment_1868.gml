/// @description Clear sequence
layer_sequence_destroy(currentSequence);
backgrounds_set_visible(true, 8);
backgrounds_set_visible(false, 0, 1, 2, 3, 4, 5, 6, 7);
kill_textboxes();
drawBlackBars = false;