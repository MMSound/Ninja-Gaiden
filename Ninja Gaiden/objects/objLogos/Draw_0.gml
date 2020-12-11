/// @description Draw text
palette_shader_set(sprFontPalette, global.uiColorIndex, false);
draw_set_font(global.gameFont);
draw_set_halign(fa_middle);
draw_text((global.viewX + (global.viewW / 2)), 100, "PRESENTS");
draw_text((global.viewX + (global.viewW / 2)), 164, "INSPIRED BY");
draw_set_halign(fa_left);
shader_reset();