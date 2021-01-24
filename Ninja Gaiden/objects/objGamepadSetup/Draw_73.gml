/// @description Drawing text
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_text(x, y, controlName[currentControl]);
draw_text(x, (y + 16), "PRESS BACKSPACE TO RESET");
palette_shader_reset();