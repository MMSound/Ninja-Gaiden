/// @description Draw text
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_font(global.gameFontLarge);
draw_text((global.viewX + (global.viewW / 2)), (global.viewY + (global.viewH / 2)), bossName);
draw_set_halign(fa_left);
draw_set_valign(fa_top);