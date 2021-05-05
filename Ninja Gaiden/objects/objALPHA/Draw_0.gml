/// @description Draw
gpu_set_blendenable(true);
gpu_set_blendmode(bm_add);
draw_self();
gpu_set_blendmode(bm_normal);