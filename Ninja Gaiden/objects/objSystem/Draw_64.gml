/// @description Draw game with shader
palette_shader_set(global.screenPalette, global.screenColorIndex, false);
draw_surface(application_surface, 0, 0);
shader_reset();