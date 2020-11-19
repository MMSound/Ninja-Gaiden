/// @description Drawing
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_self();
draw_set_font(global.gameFont);
draw_text(144, 208, "1989-2020");
shader_reset();