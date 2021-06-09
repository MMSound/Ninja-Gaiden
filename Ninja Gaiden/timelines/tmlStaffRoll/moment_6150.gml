/// @description Clear sequence
layer_sequence_destroy(currentSequence);
kill_textboxes();
drawBlackBars = false;
instance_create_depth(global.viewX, global.viewY, depth, objStaffRoll);