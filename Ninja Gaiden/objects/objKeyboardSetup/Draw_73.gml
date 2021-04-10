/// @description Drawing text
palette_shader_set(sprFontPalette, global.uiColorIndex, false);

var _drawX = ((global.viewX + (global.viewW / 2)) - ((string_length(controlName[currentControl]) * 8) / 2));
var _drawY = (global.viewY + 16);
draw_text(_drawX, _drawY, controlName[currentControl]);

_drawX = ((global.viewX + (global.viewW / 2)) - ((string_length("PRESS BACKSPACE TO RESET") * 8) / 2));
draw_text(_drawX, (_drawY + 16), "PRESS BACKSPACE TO RESET");

palette_shader_reset();