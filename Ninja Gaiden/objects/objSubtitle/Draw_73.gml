/// @description Draw text
var _drawX = (global.viewX + (global.viewW / 2));
draw_sprite(spr8x8Dither, 0, _drawX, drawY);
draw_set_halign(fa_middle);
draw_set_font(global.gameFont);
draw_set_color(c_black);
draw_text((_drawX + 1), (drawY + 1), myText);
draw_set_color(c_white);
draw_text_shaded(_drawX, drawY, myText, global.uiColorIndex, sprFontPalette, global.gameFont);
draw_set_halign(fa_left);